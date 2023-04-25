---
title: Whois privacy API | DNSimple API v2
excerpt: This page documents the DNSimple WHOIS privacy API v2.
---

# Whois privacy API

* TOC
{:toc}

Enable and disable WHOIS privacy on registered domains.

<info>
Now you can enable WHOIS Privacy protection for any of your domains any time, as long as the domain is registered with us, and the TLD (Top Level Domain) supports WHOIS Privacy, the WHOIS Privacy service will stay enabled until it is disabled.
</info>


## Retrieve the domain WHOIS privacy {#getWhoisPrivacy}

    GET /:account/registrar/domains/:domain/whois_privacy

Get the WHOIS privacy details for a domain.

<warning>
**The deprecation period for this endpoint began on 01 May 2023.**

You can retrieve a domain WHOIS privacy state through [retrieve domain](/v2/domains/#getDomain)
</warning>

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

Enable the WHOIS privacy service.

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

Responds with HTTP 200 if WHOIS privacy is enabled.

Responds with HTTP 201 if WHOIS privacy is only enabled because it was purchased previously. Response available only on legacy domains.

~~~json
<%= pretty_print_fixture("/api/enableWhoisPrivacy/success.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2#bad-request) if WHOIS privacy cannot be enabled.

Responds with [HTTP 401](/v2#unauthorized) in case of case of authentication issues.

Responds with [HTTP 402](/v2#payment-required) if the account has outstanding payments. Response available only on legacy domains.

## Disable WHOIS privacy {#disableWhoisPrivacy}

      DELETE /:account/registrar/domains/:domain/whois_privacy

Disable the WHOIS privacy service.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Disable WHOIS privacy for the domain `example.com` in the account `1010`:

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

Responds with [HTTP 400](/v2#bad-request) if WHOIS privacy cannot be disabled.

Responds with [HTTP 401](/v2#unauthorized) in case of case of authentication issues.

## Renew WHOIS privacy {#renewWhoisPrivacy}

~~~
POST /:account/registrar/domains/:domain/whois_privacy/renewals
~~~

<warning>
**The deprecation period for this endpoint began on 01 May 2023.**

You no longer need to renew the WHOIS privacy service. It will stay enabled until it is disabled.
</warning>

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Renew WHOIS privacy for the domain `example.com` in the account `1010`:

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

Responds with [HTTP 400](/v2#bad-request) if WHOIS privacy cannot be renewed.

Responds with [HTTP 401](/v2#unauthorized) in case of case of authentication issues.
