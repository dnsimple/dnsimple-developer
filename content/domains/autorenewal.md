---
title: Domain Auto-renewal
---

# Domain Auto-renewal API

* TOC
{:toc}


## Enable domain auto-renewal

    POST /domains/:domain/auto_renewal

### Params

:domain
: The _string_ domain name or _integer_ domain id

### Example

Enable auto-renewal for the domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://dnsimple.com/domains/:domain/auto_renewal

### Response

Responds with HTTP 200 on success, returns the domain.

~~~ js
{
  "domain": {
    "id": 1,
    "user_id": 2,
    "registrant_id": 100,
    "name": "example.com",
    "unicode_name": "example.com",
    "lockable": true,
    "auto_renew": true,
    "state": "registered",
    "language": null,
    "token": "Nv44bvvtYxmpdeu75UVJBrCcCF0Y+2TBMA",
    "created_at": "2013-01-24T19:23:08Z",
    "updated_at": "2012-12-07T14:55:25Z",
    "expires_on": "2012-03-18",
    "record_count": 0,
    "service_count": 0,
    "private_whois?": false
  }
}
~~~


## Disable domain auto-renewal

    DELETE /domains/:domain/auto_renewal

### Params

:domain
: The _string_ domain name or _integer_ domain id

### Example

Disable auto-renewal for the domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/:domain/auto_renewal

### Response

Responds with HTTP 200 on success, returns the domain.

~~ js
{
  "domain": {
    "id": 1,
    "user_id": 2,
    "registrant_id": 100,
    "name": "example.com",
    "unicode_name": "example.com",
    "lockable": true,
    "auto_renew": false,
    "state": "registered",
    "language": null,
    "token": "Nv44bvvtYxmpdeu75UVJBrCcCF0Y+2TBMA",
    "created_at": "2013-01-24T19:23:08Z",
    "updated_at": "2012-12-07T14:55:25Z",
    "expires_on": "2012-03-18",
    "record_count": 0,
    "service_count": 0,
    "private_whois?": false
  }
}
~~~
