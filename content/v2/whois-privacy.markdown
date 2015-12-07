---
title: Whois Privacy | DNSimple API v2
excerpt: This page documents the DNSimple whois privacy API v2.
---

# Whois Privacy API

Enable and disable whois privacy on registered domains.

* TOC
{:toc}


## Get whois privacy for a domain {#get}

    GET /:account/domains/:domain/whois_privacy

Get the whois privacy details for a domain.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Whois privacy for the domain example.com in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/whois_privacy

### Response

Responds with HTTP 200 if whois privacy is purchased for the domain.

~~~js
{}
~~~

Responds with HTTP 404 if whois privacy is not purchased.

## Enable whois privacy {#enable}

      PUT /:account/domains/:domain/whois_privacy

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Enable whois privacy for the domain example.com.

Note that if the whois privacy is not purchased for the domain, enabling whois
privacy will cause the service to be purchased for a period of 1 year.

If whois privacy was previously purchased and disabled, then calling this will
enable the whois privacy.

Whois privacy for the domain example.com in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X PUT \
          https://api.dnsimple.com/v2/1010/domains/example.com/whois_privacy

### Response

Responds with HTTP 201 if whois privacy is purchased and enabled.

Responds with HTTP 200 if whois privacy is only enabled because it was purchased
previously.

~~~js
{}
~~~

## Disable whois privacy {#disable}

      DELETE /:account/domains/:domain/whois_privacy

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Disable whois privacy for the domain example.com.

Note that if the whois privacy is not purchased for the domain, this method will
do nothing.

If whois privacy was previously purchased and enabled, then calling this will
disable the whois privacy.

Whois privacy for the domain example.com in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/domains/example.com/whois_privacy

### Response

Responds with HTTP 200 if whois privacy is disabled.

~~~js
{}

