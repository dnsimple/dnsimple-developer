require "dnsimple"
# template imports:start
# template imports:end

# template script:start
client = Dnsimple::Client.new({
    access_token: ENV["DNSIMPLE_TOKEN"],
    base_url: "https://api.sandbox.dnsimple.com",
})
# will send calls to sandbox API
# template script:end

puts "SUCCESS"
