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

def blog_articles
  uri = URI('https://blog.dnsimple.com/feed.json')
  res = Net::HTTP.get(uri)
  feed = JSON.parse(res, { symbolize_names: true })
  features = feed[:items].select { |item| item[:tags].downcase.include? "feature" }

  main = features.find { |item| item[:illustration] }
  secondary = features.select { |item| item[:title] != main[:title] }

  {
    main:,
    secondary: secondary.take(2)
  }
end
