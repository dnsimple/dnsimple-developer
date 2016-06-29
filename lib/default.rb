require 'net/http'
require 'json'

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::XMLSitemap


ROOT = File.expand_path("../../", __FILE__)

def read_http_fixture(filename)
  File.read(File.join(ROOT, "fixtures", "v2", filename))
end

alias read_fixture read_http_fixture

def pretty_print_fixture(filename)
  raw_response = read_http_fixture(filename)

  socket   = Net::BufferedIO.new(StringIO.new(raw_response))
  response = Net::HTTPResponse.read_new(socket)
  transfer_encoding = response.delete('transfer-encoding')
  response.reading_body(socket, true) {}

  JSON.pretty_generate(JSON.parse(response.read_body))
end

def api_v2_changelog
  api_v2_changelog_items.map do |item|
    "#{item[:time].to_date}: #{item[:description]}"
  end.join("\n")
end

def api_v2_changelog_items
  require 'yaml'

  YAML.load(read_fixture('changelog.yml')).map do |time, entry|
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

  # Build feed
  xml.instruct!
  xml.rss(version: '2.0') do
    xml.channel do
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
          xml.guid        url
          xml.link        url
          xml.author      @config[:author_email]
        end
      end
    end
  end

  buffer
end
