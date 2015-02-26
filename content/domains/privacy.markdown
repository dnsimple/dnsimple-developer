---
title: WHOIS Privacy Protection
excerpt: Welcome to DNSimple. This page is about our WHOIS Privacy Protection API. Hosted DNS has never been this easy.
---

# WHOIS Privacy Protection API

WHOIS Privacy Protection replaces a domain's WHOIS data with a proxy service to protect a customer's address, phone number and email address. The service is a paid service and must be renewed on a yearly basis.

* TOC
{:toc}


## Enable domain WHOIS Privacy {#enable}

    POST /domains/:domain/whois_privacy

If WHOIS Privacy Protection has not yet been purchased then invoking this will purchase the service and enable it.
If the privacy protection is currently disabled then it will be enabled.

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

Enable WHOIS privacy for the domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://api.dnsimple.com/v1/domains/example.com/whois_privacy

### Response

Responds with HTTP 201 on success.

~~~js
{
  "whois_privacy": {
    "id": 1,
    "domain_id": 12,
    "enabled": true,
    "expires_on": "2015-12-22"
  }
}
~~~


## Disable domain WHOIS Privacy {#disable}

    DELETE /domains/:domain/whois_privacy

If the privacy protection has not expired it can always be turned back on with no additional charge.

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

Disable WHOIS privacy for the domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/domains/example.com/whois_privacy

### Response

Responds with HTTP 200 on success.

~~~js
{
  "whois_privacy": {
    "id": 1,
    "domain_id": 12,
    "enabled": false,
    "expires_on": "2015-12-22"
  }
}
~~~
