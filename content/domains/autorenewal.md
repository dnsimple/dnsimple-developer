---
title: Domain Auto-renewal
---

# Domain Auto-renewal API

* TOC
{:toc}


## Enable domain auto-renewal {#enable}

    POST /domains/:domain/auto_renewal

### Parameters

| Name | Type | Description |
| -----|------|-------------|
`:domain` | `string`, `integer` | The domain name or id

### Example

Enable auto-renewal for the domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://api.dnsimple.com/v1/domains/:domain/auto_renewal

### Response

Responds with HTTP 200 on success, returns the domain.

~~~ js
{
  "domain": {
    "id": 227,
    "user_id": 19,
    "registrant_id": 28,
    "name": "example.com",
    "unicode_name": "example.com",
    "token": "domain-token",
    "state": "registered",
    "language": null,
    "lockable": true,
    "auto_renew": true,
    "whois_protected": false,
    "record_count": 7,
    "service_count": 0,
    "expires_on": "2015-01-16",
    "created_at": "2014-01-15T22:01:55Z",
    "updated_at": "2014-01-16T22:56:22Z"
  }
}
~~~


## Disable domain auto-renewal {#disable}

    DELETE /domains/:domain/auto_renewal

### Parameters

| Name | Type | Description |
| -----|------|-------------|
`:domain` | `string`, `integer` | The domain name or id

### Example

Disable auto-renewal for the domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/domains/:domain/auto_renewal

### Response

Responds with HTTP 200 on success, returns the domain.

~~~ js
{
  "domain": {
    "id": 227,
    "user_id": 19,
    "registrant_id": 28,
    "name": "example.com",
    "unicode_name": "example.com",
    "token": "domain-token",
    "state": "registered",
    "language": null,
    "lockable": true,
    "auto_renew": false,
    "whois_protected": false,
    "record_count": 7,
    "service_count": 0,
    "expires_on": "2015-01-16",
    "created_at": "2014-01-15T22:01:55Z",
    "updated_at": "2014-01-16T22:56:22Z"
  }
}
~~~
