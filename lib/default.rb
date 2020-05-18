require 'net/http'
require 'json'

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::XMLSitemap

# TODO: Remove this monkey-patch if https://github.com/ruby/ruby/pull/3117 get merged.
module Net
  class HTTPResponse
    class << self
      def read_status_line(sock)
        str = sock.readline
        m = /\AHTTP(?:\/(\d+\.?\d*))?\s+(\d\d\d)(?:\s+(.*))?\z/in.match(str) or
          raise Net::HTTPBadResponse, "wrong status line: #{str.dump}"
        m.captures
      end
    end
  end
end

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
