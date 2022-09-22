---
title: Whois privacy API | DNSimple API v2
excerpt: This page documents the DNSimple WHOIS privacy API v2.
---

# Whois privacy API

* TOC
{:toc}

Enable and disable WHOIS privacy on registered domains.


## Retrieve the domain WHOIS privacy {#getWhoisPrivacy}

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

Responds with HTTP 200 on success

~~~json
<%= pretty_print_fixture("/api/getWhoisPrivacy/success.http") %>
~~~

## Enable WHOIS privacy {#enableWhoisPrivacy}

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

### Errors

Responds with [HTTP 400](/v2#bad-request) if the whois privacy cannot be enabled.

Responds with [HTTP 401](/v2#unauthorized) in case of case of authentication issues.

Responds with [HTTP 402](/v2#payment-required) if the account has outstanding payments.

## Disable WHOIS privacy {#disableWhoisPrivacy}

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

### Errors

Responds with [HTTP 400](/v2#bad-request) if the whois privacy cannot be disabled.

Responds with [HTTP 401](/v2#unauthorized) in case of case of authentication issues.

## Renew WHOIS privacy {#renewWhoisPrivacy}

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

### Errors

Responds with [HTTP 400](/v2#bad-request) if the whois privacy cannot be renewed.

Responds with [HTTP 401](/v2#unauthorized) in case of case of authentication issues.
