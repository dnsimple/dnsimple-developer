require 'net/http'
require 'json'

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::XMLSitemap


ROOT = File.expand_path("../../", __FILE__)

def read_http_fixture(filename)
  File.read(File.join(ROOT, "fixtures", "v2", filename))
end

def pretty_print_fixture(filename)
  raw_response = read_http_fixture(filename)

  socket   = Net::BufferedIO.new(StringIO.new(raw_response))
  response = Net::HTTPResponse.read_new(socket)
  transfer_encoding = response.delete('transfer-encoding')
  response.reading_body(socket, true) {}

  body = response.read_body
  body ? JSON.pretty_generate(JSON.parse(body)) : nil
end

def api_v2_changelog
  api_v2_changelog_items.map do |item|
    %(<span><a name="#{format_timestamp(item[:time])}">#{item[:time].to_date}</a>: #{item[:description]}</span>)
  end.join('<br/><br/>')
end

def api_v2_changelog_items
  require 'yaml'

  YAML.load(File.read(ROOT + '/content/v2/_changelog.yml')).map do |time, entry|
    Hash[
      title:       entry.fetch('title'),
      description: entry.fetch('description'),
      time:        time
    ]
  end
end

def atom_feed(items)
  require 'builder'

  buffer = ''
  xml    = Builder::XmlMarkup.new(target: buffer, indent: 2)
  time   = (items.first && items.first[:time]) || @item[:mtime]
  url    = @item[:url] || @config[:base_url]
  author = @config[:author_email] || 'support@dnsimple.com (DNSimple)'

  # Build feed
  xml.instruct!
  xml.rss(version: '2.0', 'xmlns:atom': 'http://www.w3.org/2005/Atom') do
    xml.channel do
      xml.tag!          'atom:link', href: 'https://developer.dnsimple.com/v2/feed.xml', rel: 'self', type: 'application/rss+xml'
      xml.title         @item[:title]
      xml.language      'en-us'
      xml.lastBuildDate time.rfc822
      xml.ttl           '40'
      xml.link          url
      xml.description   @item[:description]

      items.each do |item|
        xml.item do
          xml.title       item[:title]
          xml.description item[:description]
          xml.pubDate     item[:time].rfc822
          xml.guid        "#{url}#{format_timestamp(item[:time])}"
          xml.link        url
          xml.author      author
        end
      end
    end
  end

  buffer
end

def format_timestamp(time)
  time.utc.strftime('%Y-%m-%d-%H:%M:%S')
end
