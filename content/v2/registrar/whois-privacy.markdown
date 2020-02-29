---
title: Whois privacy API | DNSimple API v2
excerpt: This page documents the DNSimple WHOIS privacy API v2.
---

# Whois privacy API

* TOC
{:toc}

Enable and disable WHOIS privacy on registered domains.


## Get WHOIS privacy for a domain {#getWhoisPrivacy}

    GET /:account/registrar/domains/:domain/whois_privacy

Get the WHOIS privacy details for a domain.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Get the WHOIS privacy for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/whois_privacy

### Response

Responds with HTTP 200 if WHOIS privacy is purchased for the domain.

~~~json
<%= pretty_print_fixture("/api/getWhoisPrivacy/success.http") %>
~~~

Responds with HTTP 404 if WHOIS privacy is not purchased.

## Enable whois privacy {#enableWhoisPrivacy}

      PUT /:account/registrar/domains/:domain/whois_privacy

Note that if the WHOIS privacy is not purchased for the domain, enabling WHOIS
privacy will cause the service to be purchased for a period of 1 year.

If WHOIS privacy was previously purchased and disabled, then calling this will
enable the WHOIS privacy.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Enable WHOIS privacy for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X PUT \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/whois_privacy

### Response

Responds with HTTP 201 if WHOIS privacy is purchased and enabled.

Responds with HTTP 200 if WHOIS privacy is only enabled because it was purchased previously.

~~~json
<%= pretty_print_fixture("/api/enableWhoisPrivacy/success.http") %>
~~~

## Disable whois privacy {#disableWhoisPrivacy}

      DELETE /:account/registrar/domains/:domain/whois_privacy

Note that if the WHOIS privacy is not purchased for the domain, this method will
do nothing.

If WHOIS privacy was previously purchased and enabled, then calling this will
disable the WHOIS privacy.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Disable whois privacy for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/whois_privacy

### Response

Responds with HTTP 200 if WHOIS privacy is disabled.

~~~json
<%= pretty_print_fixture("/api/disableWhoisPrivacy/success.http") %>
~~~

## Renew whois privacy {#renewWhoisPrivacy}

~~~
POST /:account/registrar/domains/:domain/whois_privacy/renewals
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Renew whois privacy for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X POST \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/whois_privacy/renewals

### Response

Responds with HTTP 201 if WHOIS privacy is renewed.

~~~json
<%= pretty_print_fixture("/api/renewWhoisPrivacy/success.http") %>
~~~

Response with HTTP 400, if WHOIS privacy was never purchased for the domain, or if there is another purchase order in progress:

~~~json
<%= pretty_print_fixture("/api/renewWhoisPrivacy/whois-privacy-not-found.http") %>
~~~
