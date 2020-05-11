require "dnsimple"
# template imports:start
# template imports:end

# template script:start
client = Dnsimple::Client.new({
    access_token: ENV["DNSIMPLE_TOKEN"],
    user_agent: "mylib/1.0",
})
# will set "mylib/1.0 dnsimple-ruby/x.x.x"
# template script:end

puts "SUCCESS"
