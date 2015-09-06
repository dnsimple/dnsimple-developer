---
title: Domain Auto-renewal
excerpt: This page documents the DNSimple domain auto-renewal API v1.
---

# Domain Auto-renewal API

* TOC
{:toc}


## Enable domain auto-renewal {#enable}

    POST /domains/:domain/auto_renewal

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

Enable auto-renewal for the domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://api.dnsimple.com/v1/domains/example.com/auto_renewal

### Response

Responds with HTTP 200 on success, returns the domain.

~~~js
{
  "domain": {
    "id": 1,
    "user_id": 21,
    "registrant_id": 321,
    "name": "example.com",
    "unicode_name": "example.com",
    "token": "domain-token",
    "state": "registered",
    "language": null,
    "lockable": false,
    "auto_renew": true,
    "whois_protected": false,
    "record_count": 5,
    "service_count": 1,
    "expires_on": "2015-09-27",
    "created_at": "2012-09-27T14:25:57.646Z",
    "updated_at": "2014-12-15T20:27:04.552Z"
  }
}
~~~


## Disable domain auto-renewal {#disable}

    DELETE /domains/:domain/auto_renewal

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

Disable auto-renewal for the domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/domains/example.com/auto_renewal

### Response

Responds with HTTP 200 on success, returns the domain.

~~~js
{
  "domain": {
    "id": 1,
    "user_id": 21,
    "registrant_id": 321,
    "name": "example.com",
    "unicode_name": "example.com",
    "token": "domain-token",
    "state": "registered",
    "language": null,
    "lockable": false,
    "auto_renew": false,
    "whois_protected": false,
    "record_count": 5,
    "service_count": 1,
    "expires_on": "2015-09-27",
    "created_at": "2012-09-27T14:25:57.646Z",
    "updated_at": "2014-12-15T20:27:04.552Z"
  }
}
~~~
