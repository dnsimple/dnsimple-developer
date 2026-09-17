require 'test_helper'
require_relative '../_sweep/client_links'

describe 'Client links' do

  INDEX = ClientLinks::Index.new([
    { 'id' => '/v2/domains/', 'body' => '<h2 id="listDomains">List domains</h2><h3 id="errors">Errors</h3>' },
    { 'id' => '/v2/webhooks/webhooks/', 'body' => '<h2 id="listWebhooks">List webhooks</h2>' },
  ])

  REDIRECTS = ClientLinks::Redirects.load(ClientLinks::ROOT)

  def check(url)
    link = ClientLinks::Link.new('client', 'file.rb', 1, url)
    ClientLinks.stale([link], INDEX, REDIRECTS).first&.reason
  end

  it 'accepts an anchor that the page publishes' do
    assert_nil check('https://developer.dnsimple.com/v2/domains/#listDomains')
    assert_nil check('https://developer.dnsimple.com/v2/domains/#errors')
  end

  it 'reports an anchor that the page does not publish' do
    assert_equal 'page /v2/domains/ has no anchor #list', check('https://developer.dnsimple.com/v2/domains/#list')
  end

  it 'reports a page that the site does not publish' do
    assert_equal 'page /v2/dnssec/ does not exist', check('https://developer.dnsimple.com/v2/dnssec/#enableDnssec')
  end

  it 'follows the redirect rules before it reads the anchors' do
    assert_nil check('https://developer.dnsimple.com/v2/webhooks/#listWebhooks')
    assert_equal 'page /v2/webhooks/webhooks/ has no anchor #list', check('https://developer.dnsimple.com/v2/webhooks/#list')
  end

  it 'does not follow a rule that answers 404' do
    assert_equal 'page /v2/unknown/ does not exist', check('https://developer.dnsimple.com/v2/unknown/#anything')
  end

  it 'ignores a link without an anchor' do
    assert_nil check('https://developer.dnsimple.com/v2/unknown/')
    assert_nil check('https://developer.dnsimple.com/')
  end

  it 'ignores a link to a file' do
    assert_nil check('https://developer.dnsimple.com/v2/openapi.yml#Domain')
  end

  it 'normalises the path and drops the query' do
    assert_nil check('https://developer.dnsimple.com/v2/domains?page=2#listDomains')
    assert_nil check('http://developer.dnsimple.com/v2/domains/index.html#listDomains')
  end

  it 'reads a link once for each place it appears' do
    Dir.mktmpdir do |directory|
      File.write(File.join(directory, 'client.java'), <<~JAVA)
        /** @see <a href="https://developer.dnsimple.com/v2/domains/#list">https://developer.dnsimple.com/v2/domains/#list</a> */
        // See https://developer.dnsimple.com/v2/domains/#getDomain.
      JAVA

      links = ClientLinks.links_in(directory, 'client')

      assert_equal ['https://developer.dnsimple.com/v2/domains/#list',
                    'https://developer.dnsimple.com/v2/domains/#getDomain'], links.map(&:url)
    end
  end

end
