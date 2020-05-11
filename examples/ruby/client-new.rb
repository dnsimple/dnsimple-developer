require "dnsimple"
# template imports:start
# template imports:end

# template script:start
client = Dnsimple::Client.new(access_token: ENV["DNSIMPLE_TOKEN"])
# template script:end

puts "SUCCESS"
