require "dnsimple"

base_url = ENV["DNSIMPLE_BASEURL"] || "https://api.sandbox.dnsimple.com"
client = Dnsimple::Client.new({
    access_token: ENV["DNSIMPLE_TOKEN"],
    user_agent: "dnsimple-examples",
    base_url: base_url,
})

res = nil
begin
  res = client.identity.whoami
rescue Dnsimple::AuthenticationFailed => exception
  puts "ERROR: #{exception.message}"
  # FIXME: AuthenticationFailed is not an exception with HTTP response
  # puts "    HTTP #{exception.http_response.code}"
  return
end

puts "SUCCESS: Request authenticated"
user = res.data.user
puts "    User    : %s" % (user ? "#{user.id} #{user.email}" : "N/A")
account = res.data.account
puts "    Account : %s" % (account ? "#{account.id} #{account.email}" : "N/A")
