#!/usr/bin/env ruby
# frozen_string_literal: true

require 'English'
require 'json'
require 'optparse'
require 'set'
require 'shellwords'
require 'tmpdir'

# Checks the developer.dnsimple.com links in the DNSimple client libraries
# against the pages and the anchors that this site publishes.
module ClientLinks

  ROOT = File.expand_path('..', __dir__)

  SITE_HOST = 'developer.dnsimple.com'
  LIVE_INDEX = "https://#{SITE_HOST}/search.json"

  CLIENTS = %w[
    dnsimple/dnsimple-csharp
    dnsimple/dnsimple-elixir
    dnsimple/dnsimple-go
    dnsimple/dnsimple-java
    dnsimple/dnsimple-node
    dnsimple/dnsimple-php
    dnsimple/dnsimple-python
    dnsimple/dnsimple-ruby
    dnsimple/dnsimple-rust
  ].freeze

  # Build output and package directories hold generated copies of the source
  # comments. A GitHub tarball does not contain them, a working copy does.
  IGNORED_DIRECTORIES = %w[.git .claude node_modules vendor deps _build target build dist doc].freeze

  URL_PATTERN = %r{https?://developer\.dnsimple\.com[^\s"'`<>\\]*}

  # Trailing punctuation that belongs to the prose, not to the URL.
  URL_TRAILER = /[)\]}>.,;:!*]+\z/

  # The site publishes its compiled page and anchor map at /search.json.
  # Read that map instead of a second copy of the nanoc routing rules.
  class Index

    # @param entries [Array<Hash>] the parsed search index
    def initialize(entries)
      @anchors = entries.to_h do |entry|
        [entry['id'], entry['body'].to_s.scan(/\bid="([^"]+)"/).flatten.to_set]
      end
      raise 'the search index is empty' if @anchors.empty?
    end

    # @param source [String] a file path or an https URL
    # @return [ClientLinks::Index]
    def self.load(source)
      body = source.start_with?('http') ? ClientLinks.fetch(source) : File.read(source, encoding: 'UTF-8')
      new(JSON.parse(body))
    end

    # @param path [String] a site path that ends with a slash
    # @return [Boolean]
    def page?(path)
      @anchors.key?(path)
    end

    # @param path [String] a site path that ends with a slash
    # @param anchor [String] a fragment without the number sign
    # @return [Boolean]
    def anchor?(path, anchor)
      @anchors.fetch(path, Set.new).include?(anchor)
    end

    # @return [Integer] the number of pages in the index
    def size
      @anchors.size
    end

  end

  # Netlify applies the rules in _redirects and in netlify.toml before it serves
  # a page, and the browser keeps the fragment across the redirect.
  class Redirects

    # @param rules [Array<Array(String, String)>] from and to pairs
    def initialize(rules)
      @exact = {}
      @splats = []
      rules.each do |from, to|
        if from.end_with?('/*')
          @splats << [from.delete_suffix('/*'), to]
        else
          @exact[from.chomp('/')] = to
        end
      end
    end

    # @param root [String] the site checkout that holds the rules
    # @return [ClientLinks::Redirects]
    def self.load(root)
      new(redirects_file(File.join(root, '_redirects')) + netlify_toml(File.join(root, 'netlify.toml')))
    end

    # @param path [String] the path of the _redirects file
    # @return [Array<Array(String, String)>]
    def self.redirects_file(path)
      return [] unless File.exist?(path)

      File.readlines(path).filter_map do |line|
        line = line.strip
        next if line.empty? || line.start_with?('#')

        from, to, status = line.split(/\s+/)
        next if to.nil? || status == '404'

        [from, to]
      end
    end

    # @param path [String] the path of the netlify.toml file
    # @return [Array<Array(String, String)>]
    def self.netlify_toml(path)
      return [] unless File.exist?(path)

      File.read(path).scan(/\[\[redirects\]\](.*?)(?=\n\[|\z)/m).filter_map do |(block)|
        from = block[/^\s*from\s*=\s*"([^"]+)"/, 1]
        to = block[/^\s*to\s*=\s*"([^"]+)"/, 1]
        # A rule that answers 404 states that the page is absent. It does not
        # move the page, so the sweep must not follow it.
        next if from.nil? || to.nil? || block[/^\s*status\s*=\s*(\d+)/, 1] == '404'

        [from, to]
      end
    end

    # @param path [String] the requested path
    # @return [String] the path that the site serves
    def resolve(path)
      4.times do
        target = @exact[path.chomp('/')] || @splats.find { |(prefix, _)| path.start_with?(prefix) }&.last
        break if target.nil? || target == path

        path = target
      end
      path
    end

  end

  Link = Struct.new(:repository, :file, :line, :url, :reason)

  class << self

    # @param source [String] the directory of a client checkout
    # @param name [String] the name to report the findings under
    # @return [Array<ClientLinks::Link>] every link to the site, once per place
    def links_in(source, name)
      found = Set.new

      Dir.glob('**/*', File::FNM_DOTMATCH, base: source).each do |entry|
        next if entry.split('/').any? { |part| IGNORED_DIRECTORIES.include?(part) }

        path = File.join(source, entry)
        next unless File.file?(path)

        text = File.read(path, encoding: 'UTF-8')
        next if text.include?("\0")

        text.scrub.each_line.with_index(1) do |line, number|
          line.scan(URL_PATTERN) { |url| found << [entry, number, url.sub(URL_TRAILER, '')] }
        end
      end

      found.sort.map { |(file, number, url)| Link.new(name, file, number, url) }
    end

    # Checks a link only when it carries a fragment. The browser keeps the
    # fragment and never sends it to the server, so the site answers 200 for a
    # fragment that no longer exists and an HTTP link checker reports nothing.
    #
    # @param links [Array<ClientLinks::Link>]
    # @param index [ClientLinks::Index]
    # @param redirects [ClientLinks::Redirects]
    # @return [Array<ClientLinks::Link>] the links that the site cannot serve
    def stale(links, index, redirects)
      links.filter_map do |link|
        path, anchor = link.url.sub(%r{\Ahttps?://#{SITE_HOST}}, '').split('?').first.to_s.split('#', 2)
        next if anchor.nil? || anchor.empty?

        path = '/' if path.nil? || path.empty?
        path = redirects.resolve(path).delete_suffix('index.html')
        path += '/' unless path.end_with?('/')
        next unless File.extname(path.chomp('/')).empty?

        if !index.page?(path)
          link.reason = "page #{path} does not exist"
        elsif !index.anchor?(path, anchor)
          link.reason = "page #{path} has no anchor ##{anchor}"
        else
          next
        end
        link
      end
    end

    # @param url [String]
    # @return [String] the response body
    def fetch(url)
      body = `curl -fsSL #{url.shellescape}`
      raise "cannot read #{url}" unless $CHILD_STATUS.success?

      body.force_encoding('UTF-8')
    end

    # @param repository [String] an owner and name pair on GitHub
    # @param directory [String] the directory to unpack into
    # @return [String] the path of the unpacked checkout
    def download(repository, directory)
      url = "https://codeload.github.com/#{repository}/tar.gz/refs/heads/main"
      system("curl -fsSL #{url.shellescape} | tar -xz -C #{directory.shellescape}", exception: true)
      File.join(directory, "#{File.basename(repository)}-main")
    end

    # @param counts [Hash{String => Hash}]
    # @param stale [Array<ClientLinks::Link>]
    # @return [String] the report to print
    def report(counts, stale)
      lines = stale.group_by(&:repository).flat_map do |name, found|
        ["#{name}:", *found.map { |link| "  #{link.file}:#{link.line}  #{link.url}  (#{link.reason})" }, '']
      end
      counts.each { |name, count| lines << format('%-20s %4d links %4d stale', name, count[:links], count[:stale]) }
      lines << format('%-20s %4d links %4d stale', 'total', counts.sum { |_, count| count[:links] }, stale.size)
      lines.join("\n")
    end

  end

end

if $PROGRAM_NAME == __FILE__
  options = { index: ClientLinks::LIVE_INDEX, format: 'text', sources: [] }

  OptionParser.new do |parser|
    parser.banner = 'Usage: ruby _sweep/client_links.rb [options]'
    parser.on('--index SOURCE', "page and anchor map to read (default #{ClientLinks::LIVE_INDEX})") { |value| options[:index] = value }
    parser.on('--local DIRECTORY', 'check this checkout instead of every client on GitHub') { |value| options[:sources] << value }
    parser.on('--format FORMAT', %w[text json], 'text (default) or json') { |value| options[:format] = value }
    parser.on('-h', '--help') do
      puts parser
      exit 0
    end
  end.parse!

  index = ClientLinks::Index.load(options[:index])
  redirects = ClientLinks::Redirects.load(ClientLinks::ROOT)
  warn "Read #{index.size} pages from #{options[:index]}"

  stale = []
  counts = {}

  check = lambda do |source, name|
    links = ClientLinks.links_in(source, name)
    found = ClientLinks.stale(links, index, redirects)
    counts[name] = { links: links.size, stale: found.size }
    stale.concat(found)
  end

  if options[:sources].empty?
    Dir.mktmpdir do |directory|
      ClientLinks::CLIENTS.each do |repository|
        warn "Downloading #{repository}"
        check.call(ClientLinks.download(repository, directory), File.basename(repository))
      end
    end
  else
    options[:sources].each { |source| check.call(source, File.basename(File.expand_path(source))) }
  end

  if options[:format] == 'json'
    puts JSON.pretty_generate(counts: counts, stale: stale.map(&:to_h))
  else
    puts ClientLinks.report(counts, stale)
  end

  exit(stale.empty? ? 0 : 1)
end
