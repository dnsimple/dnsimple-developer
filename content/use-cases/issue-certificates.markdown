---
title: Issuing Certificates
excerpt: In this tutorial, we'll cover how to issue a certificate with LetsEncrypt for a domain you manage.
---

# Issuing Certificates

In this tutorial, we'll cover how to issue a certificate with LetsEncrypt for a domain you manage. We'll discuss how to request a certificate, and using webhooks to track when the certificate has been issued and is ready for installation.

### How it works - overview 

1. A customer registers a domain with your service, or brings their domain and points it to your [vanity name servers](https://blog.dnsimple.com/2020/08/vanity-name-servers/).
2. Your application requests to issue a certificate for your customer's domain, so you can provide a secure connection to your service.
3. A webhook is fired to notify you that the certificate has been issued and is ready for installation.
4. Your application downloads the private key and certificates for use in third-party integrations to install the certificate in your servers.


---

_The tutorial is written in Ruby. The code provided is part of a Sinatra application. Other popular frameworks such Ruby on Rails, Hanami, etc. can also integrate the code._

## Prerequisites

For this tutorial, you'll need the following dependencies:

* DNSimple [API Access Token](https://support.dnsimple.com/articles/api-access-token/).
* At least one domain in your account that is delegated to DNSimple.

## Tools

For this tutorial, you'll be working with the following tools:

* [Sinatra framework](http://sinatrarb.com/) - We'll use Sinatra to structure the application.
* [Certificate resource](/v2/certificates/) - We'll use the DNSimple API to make the certificate requests.

## Configure your DNSimple Application 

1. Download the code from [our GitHub repository](https://github.com/dnsimple/dnsimple-api-examples/tree/main/ruby/use_cases/issue_certificates).
2. Follow the instructions in the README on GitHub.

<note>
Certificate issue requests are only supported in Production.
</note>

On startup, the application should have registered a webhook endpoint. Use the UI, or make the following call in a pry session `echo 'App::DnsimpleAdapter.all_webhooks.map(&:url)' | bundle exec pry`, to check that this is the case before proceeding.

## Handling the certificate issue request

When your customer registers a domain through your service, or delegates it for you to manage, as part of your provisioning process, you can request a certificate to be issued for the newly added domain. The request is made up of two separate API calls. The first one is to "purchase" the certificate. It's immediately followed by an issue request.

[lib/app/dnsimple.rb](https://github.com/dnsimple/dnsimple-api-examples/blob/main/ruby/use_cases/issue_certificates/lib/app/dnsimple.rb#L16)

~~~ruby
    post '/issue_certificate' do
      certificate_order = App::DnsimpleAdapter.purchase_letsencrypt_certificate(
        parsed_request_body['domain'],
        App.config.dnsimple['contact_id'],
        name: parsed_request_body['name'],
        alternate_names: parsed_request_body['san']&.split(','),
        auto_renew: parsed_request_body.fetch('auto_renew', true)
      )
      certificate = App::DnsimpleAdapter.issue_letsencrypt_certificate(parsed_request_body['domain'],
                                                                       certificate_order.certificate_id)

      json(data: {
             certificate_id: certificate.id,
             common_name: certificate.common_name,
             san: certificate.alternate_names,
             state: certificate.state,
             auto_renew: certificate.auto_renew
           })
    rescue ::Dnsimple::NotFoundError, ::Dnsimple::RequestError => e
      halt 400, json(error: { message: e.message })
    end
~~~

In our sample application, we expose an endpoint `http://localhost:4567/dnsimple/issue_certificate` that takes the following parameters:

* `domain` - The Domain name in your account for which you want to issue a certificate - e.g. `pizza.company`

* `name` - Certificate name, where `*` can be used for wildcard certificates.

* `san` - A certificate can be purchased for multiple subdomains. We call them alternate names or [Subject Alternative Name (SAN)](https://support.dnsimple.com/articles/what-is-ssl-san/).

* `auto_renewal` - If a certificate should be auto-renewed by DNSimple.

You can learn more about the specific parameters on the certificate resource API page [/v2/certificates](/v2/certificates/#purchaseLetsencryptCertificate).

## Handling a certificate issue event

The certificate issue process is asynchronous. It can take a while for the certificate to be processed by LetsEncrypt. DNSimple sends out an event `certificate.issue` when processing is complete.
The event contains useful information, like the certificate ID, which can be used to retrieve and install it.

[lib/app/handlers/certificate_issue_event_handler.rb](https://github.com/dnsimple/dnsimple-api-examples/blob/main/ruby/use_cases/issue_certificates/lib/app/handlers/certificate_issue_event_handler.rb#L8)

~~~ruby
      def handle(event)
        certificate = App::DnsimpleAdapter.download_certificate(
          event.data['certificate']['domain_id'],
          event.data['certificate']['id']
        )
        private_key = App::DnsimpleAdapter.certificate_private_key(
          event.data['certificate']['domain_id'],
          event.data['certificate']['id']
        ).private_key

        # Now you can carry out your business logic of pushing the certificate to
        # your infrastructure automation tool and secrets store.
      end
~~~

<note>
Webhooks come with no order guarantee, and are guaranteed to be delivered at least once. This means a given webhook can be sent multiple times. You can use the `request_identifier`, which is present in every event, to keep track of which events have already been processed. We also recommend only using the underlying resource ID provided in the webhook event data to retrieve the resource; this adds protection from forged events.
</note>
