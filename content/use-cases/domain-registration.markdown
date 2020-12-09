---
title: Registering a domain
excerpt: Register a domain on behalf of your users. Gather and send contact information required by the register. Create purchase orders and track their progress, so you can keep your users in the know.
---

# Registering a domain

Register domains on behalf of your users. Gather and send contact information required by the register. Create purchase orders and track their progress so you can keep your users in the know.

### How it works at a high level

1. The user requests for a domain to be registered.
2. Your application checks the availability of the domain.
3. You construct and gather the contact details required for domain registration.
4. A registration order is created for the domain, and key information is persisted in your application.
5. Notify your customer when the domain is registered and online.


---

_The code provided is written in Ruby and is modelled as a service that can be adopted as a stand-alone script into Rails or Sinatra_

## Prerequisites

For this tutorial, you'll need the following dependencies:

* [DNSimple Ruby Client](https://dnsimple.link/api-client-ruby)
* [Public suffix parser](https://github.com/weppos/publicsuffix-ruby) for ruby
* DNSimple [API Access Token](https://support.dnsimple.com/articles/api-access-token/)
* Your DNSimple account number – you can find it in the URL when visiting a domain, or when the API Access Token was issued.


## Configuring the API client

You'll need to interact with the API extensively, so it's a good idea to create an adapter to encapsulate the interaction between your system and our API.

~~~ruby
require 'dnsimple'

class DnsimpleAdapter
  SANDBOX_ENDPOINT = 'https://api.sandbox.dnsimple.com'.freeze
  PRODUCTION_ENDPOINT = 'https://api.dnsimple.com'.freeze

  class << self
    attr_accessor :api_access_token, :account_id, :endpoint

    # Set your configuration with block
    def configure
      yield(self)
    end

    # Returns the configuration hash
    #
    # @return [Hash]
    def config
      @config ||= {
        api_access_token: api_access_token,
        account_id: account_id,
        endpoint: endpoint || SANDBOX_ENDPOINT
      }.freeze
    end

    # Returns a configured DNSimple API client
    def client
      Dnsimple::Client.new(
        base_url: config[:endpoint],
        access_token: config[:api_token]
      )
    end
  end
end
~~~

Now you can initialize the adapter with your *API Access Token* and *Account number*.

~~~ruby
DnsimpleAdapter.configure do |config|
  config.api_access_token = "<your access token>"
  config.account_id = "<your account number>"
end
~~~


## Checking the domain's availability

When a user wants to register a domain, the first step is to check if the domain is available for registration.

To do this, add a method to your adapter that wraps around the API's `check_domain` call.

~~~ruby
    def check_domain(domain)
      client.registrar.check_domain(config[:account_id], domain).data
    end
~~~

Now we can check if the domain is avialable by making a request and examining the [response](/v2/registrar/#checkDomain):

~~~ruby
domain_name = "makeideashappen.com"
domain = DnsimpleAdapter.check_domain(domain_name)

raise 'Domain is not available' unless domain.available
~~~

If the requested domain is not available, we raise an error as a way to stop the execution of our code. However, it's a good idea to inform your customers that the domain is taken, and they should explore other options.

## Gathering extended attributes for the domain

Some ccTLDs, like **.FR**, **.ASIA**, **.EU**, etc. require additional information to register the domain.

To do this, we can add a method to our adapter that makes a call and gets the extended attributes for a TLD.

~~~ruby
    def tld_extended_attributes(tld)
      client.tlds.tld_extended_attributes(tld).data
    end
~~~

This endpoint requires only the TLD be provided, so you need to extract it from your customer's input. There are some helpful libraries you can use instead of rolling out your own custom implementation.

~~~ruby
require 'public_suffix'

domain_name = PublicSuffix.parse("makeideashappen.eu")
domain_name.tld # => 'eu'

extended_attributes = DnsimpleAdapter.tld_extended_attributes(domain_name.tld)
~~~

In case `extended_attributes` is an empty array, there are no extended attributes to presented to the user. However, if there are attributes, they will have the following structure:

~~~ruby
{
  'name' => 'attribute-name',
  'title' => 'Title explaining what the field requires',
  'description' => 'Optional description elaborating on what and why this field is needed',
  'required' => true,
  'options' => [
    {
      'title' => 'Name of option',
      'value' => 'accepted-value',
      'description' => 'Optional description'
    }
  ]
}
~~~

* `required` indicates if the field MUST be filled in or it can be left blank.
* `options` if it's a blank array `[]` it means the value must be provided by the user.

For example **.EU** will return:

~~~ruby
{ 'name' => 'x-eu-registrant-citizenship',
  'title' => 'Private Registrant European Citizenship',
  'description' =>
   'In case the registrant is a private person, it is possible to register a .EU domain even though the registrant is not based in the EU. The registrant however must have an European Citizenship in these cases.',
  'required' => false,
  'options' =>
   [{ 'title' => 'Austrian', 'value' => 'at', 'description' => nil },
    { 'title' => 'Belgian', 'value' => 'be', 'description' => nil },
    { 'title' => 'Bulgarian', 'value' => 'bg', 'description' => nil },
    { 'title' => 'Croatian', 'value' => 'hr', 'description' => nil },
    { 'title' => 'Cyprian', 'value' => 'cy', 'description' => nil },
    { 'title' => 'Czech', 'value' => 'cz', 'description' => nil },
    { 'title' => 'Danish', 'value' => 'dk', 'description' => nil },
    { 'title' => 'Dutch', 'value' => 'nl', 'description' => nil },
    { 'title' => 'Estonian', 'value' => 'ee', 'description' => nil },
    { 'title' => 'Finnish', 'value' => 'fi', 'description' => nil },
    { 'title' => 'French', 'value' => 'fr', 'description' => nil },
    { 'title' => 'German', 'value' => 'de', 'description' => nil },
    { 'title' => 'Greek', 'value' => 'gr', 'description' => nil },
    { 'title' => 'Hungarian', 'value' => 'hu', 'description' => nil },
    { 'title' => 'Irish', 'value' => 'ie', 'description' => nil },
    { 'title' => 'Italian', 'value' => 'it', 'description' => nil },
    { 'title' => 'Latvian', 'value' => 'lv', 'description' => nil },
    { 'title' => 'Lithuanian', 'value' => 'lt', 'description' => nil },
    { 'title' => 'Luxembourger', 'value' => 'lu', 'description' => nil },
    { 'title' => 'Maltese', 'value' => 'mt', 'description' => nil },
    { 'title' => 'Polish', 'value' => 'pl', 'description' => nil },
    { 'title' => 'Portuguese', 'value' => 'pt', 'description' => nil },
    { 'title' => 'Romanian', 'value' => 'ro', 'description' => nil },
    { 'title' => 'Slovak', 'value' => 'sk', 'description' => nil },
    { 'title' => 'Slovenian', 'value' => 'si', 'description' => nil },
    { 'title' => 'Spanish', 'value' => 'es', 'description' => nil },
    { 'title' => 'Swedish', 'value' => 'se', 'description' => nil }] }
~~~

Now that you know how to handle extended attributes, it's a good time to present them to your customer. Make sure to validate the presence of any required attributes. This is important because domain registration isn't possible without them.

## Creating a contact for your user

For a domain to be registered it needs to have an associated contact in our system. You'll probably want to provide your customer's contact details instead of your own, so the contact will need to be created in our system.

~~~ruby
    def create_contact(contact_details)
      client.contacts.create_contact(config[:account_id], contact_details).data
    end
~~~

To create the contact, you can call the `create_contact` method with your customer's details.

~~~ruby
customer_contact_details = {
  "email": 'john.smith@example.com',
  "first_name": 'John',
  "last_name": 'Smith',
  "address1": '123 Main Street',
  "city": 'New York',
  "state_province": 'NY',
  "postal_code": '11111',
  "country": 'US',
  "phone": '+1 321 555 4444'
}

contact = DnsimpleAdapter.create_contact(customer_contact_details)
~~~

You can see all available contact fields [here](v2/contacts/#createContact).

Now that you have a contact available for your customer, it's a good idea to store the `contact.id` in your system for easy programmatic access, since you'll need it later.

## Registering a webhook

Before we proceed to registering the domain, make sure you have a webhook registered and listening to events, in order to synch your local state to the domain's state. It can take some time for the domain to be fully registered, and webhooks can help you notify your customer when the registration is complete.

~~~ruby
    def register_webhook(url)
      client.webhooks.create_webhook(config[:account_id], { url: url }).data
    end
~~~

You will likely only ever need to register a single webhook for your system. For this tutorial, we can use a third-party service [RequestBin](https://requestbin.com/) to provide us with a visualisation of the events we would expect to receive from our system. You can also use secure local proxy tunneling, like [Ngrok](https://ngrok.com/download), while developing and testing your webhook integration.

~~~ruby
url = '<url of HTTP event source>'
DnsimpleAdapter.register_webhook(url)
~~~

## Registering the domain

Now that we've prepared all the required components, we can register the domain.

* Domain name that's available for registration.
* The TLD's extended attributes – if applicable.
* Customer contact in our system.
* Registered webhook for us to receive updates on account activity and resource states (Optional).

We can create a method in our adapter to allow us to register domains via the API client.

~~~ruby
    def register_domain(domain, registrant_id, whois_privacy: false, auto_renew: true, extended_attributes: {})
      client.registrar.register_domain(
        config[:account_id],
        domain,
        {
          registrant_id: registrant_id,
          whois_privacy: whois_privacy,
          auto_renew: auto_renew,
          extended_attributes: extended_attributes
        }
      ).data
    end
~~~

We can register a user's chosen domain using all the previously-obtained information. 

~~~ruby
domain_name = 'makeideashappen.com'
domain_registration = DnsimpleAdapter.register_domain(domain_name, contanct.id)
~~~

We didn't include any extended attributes, because there are none for **.COM**.
The [domain registration](v2/registrar/#registerDomain) will hold the domain's ID in our system (which you may want to store for later use, and possibly associate it with your users).

The webhook you registered would receive updates on the domain's registration status. It can take some time before the domain is registered, and it's a good way to keep your system synced. The two events you'll be interested in when registering a domain are [**domain.register:started**](https://github.com/dnsimple/dnsimple-developer/blob/master/fixtures/v2/webhooks/domain.register/status-started.http) and [**domain.register**](https://github.com/dnsimple/dnsimple-developer/blob/master/fixtures/v2/webhooks/domain.register/example.http).


Here's the complete adapter after all the additions we made throughout the tutorial:

~~~ruby
require 'dnsimple'
require 'public_suffix'

class DnsimpleAdapter
  SANDBOX_ENDPOINT = 'https://api.sandbox.dnsimple.com'.freeze
  PRODUCTION_ENDPOINT = 'https://api.dnsimple.com'.freeze

  class << self
    attr_accessor :api_token, :account_id, :endpoint

    # Set your configuration with block
    def configure
      yield(self)
    end

    # Returns the configuration hash
    #
    # @return [Hash]
    def config
      @config ||= {
        api_token: api_token,
        account_id: account_id,
        endpoint: endpoint || SANDBOX_ENDPOINT
      }.freeze
    end

    # Returns a configured DNSimple API client
    def client
      Dnsimple::Client.new(
        base_url: config[:endpoint],
        access_token: config[:api_token]
      )
    end

    def check_domain(domain)
      client.registrar.check_domain(config[:account_id], domain)
    end

    def create_contact(contact_details)
      client.contacts.create_contact(config[:account_id], contact_details)
    end

    def tld_extended_attributes(tld)
      client.tlds.tld_extended_attributes(tld)
    end

    def register_domain(domain, registrant_id, whois_privacy: false, auto_renew: true, extended_attributes: {})
      client.registrar.register_domain(
        config[:account_id],
        domain,
        {
          registrant_id: registrant_id,
          whois_privacy: whois_privacy,
          auto_renew: auto_renew,
          extended_attributes: extended_attributes
        }
      ).data
    end

    def register_webhook(url)
      client.webhooks.create_webhook(config[:account_id], { url: url }).data
    end
  end
end
~~~
