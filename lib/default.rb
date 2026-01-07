# Default helper functions for Nanoc site generation
# Provides utilities for reading fixtures, fetching blog articles, and markdown processing

require 'net/http'
require 'json'
require 'kramdown'

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::XMLSitemap

# Root directory of the project (two levels up from this file)
ROOT = File.expand_path("../../", __FILE__)

# Reads an HTTP fixture file from the fixtures directory
#
# @param filename [String] The filename relative to fixtures/v2/
# @return [String] The contents of the fixture file
def read_http_fixture(filename)
  File.read(File.join(ROOT, "fixtures", "v2", filename))
end

# Parses an HTTP fixture file and returns a pretty-printed JSON representation
#
# This function simulates parsing an HTTP response by creating a Net::HTTPResponse
# object from the raw fixture data, then extracts and pretty-prints the JSON body.
#
# @param filename [String] The filename relative to fixtures/v2/
# @return [String, nil] Pretty-printed JSON string, or nil if body is empty
def pretty_print_fixture(filename)
  raw_response = read_http_fixture(filename)

  # Parse the raw HTTP response into a Net::HTTPResponse object
  socket   = Net::BufferedIO.new(StringIO.new(raw_response))
  response = Net::HTTPResponse.read_new(socket)
  transfer_encoding = response.delete('transfer-encoding')
  response.reading_body(socket, true) {}

  # Extract and pretty-print the JSON body
  body = response.read_body
  body ? JSON.pretty_generate(JSON.parse(body)) : nil
end

# Fetches blog articles from the DNSimple blog feed and filters for featured articles
#
# Retrieves the JSON feed from blog.dnsimple.com, filters for articles tagged as "feature",
# and returns a hash with the main featured article (one with an illustration) and up to
# two secondary featured articles.
#
# @return [Hash] Hash with :main and :secondary keys containing article data
# @raise [StandardError] If the HTTP request fails or JSON parsing fails
def blog_articles
  uri = URI("https://blog.dnsimple.com/feed.json")

  # Configure HTTP client with SSL
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  begin
    res = http.get(uri.path)
  rescue OpenSSL::SSL::SSLError
    # Fallback: if CRL check fails, try without strict verification
    # This can happen when the certificate store can't fetch CRL
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.get(uri.path)
  end

  # Parse the JSON feed and filter for featured articles
  feed = JSON.parse(res.body, { symbolize_names: true })
  features = feed[:items].select { |item| item[:tags].downcase.include? "feature" }

  # Find the main featured article (one with an illustration) and secondary articles
  main = features.find { |item| item[:illustration] }
  secondary = features.select { |item| item[:title] != main[:title] }

  {
    main: main,
    secondary: secondary.take(2)
  }
end
