---
title: Domain Registry
---

# Domain Registry API

* TOC
{:toc}


## Register a domain

Register a domain name with DNSimple and the appropriate domain registry.

    POST /domain_registrations

Your account must already be active for this command to complete successfully.
You will be automatically charged the 1 year registration fee upon successful registration,
so please be careful with this command.

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d <data> \
          https://api.dnsimple.com/v1/domain_registrations

### Input

domain.name
: Required _string_

domain.registrant_id
: Required _integer_ The ID of an existing contact in your account.

domain.extended_attribute
: optional _hash_ For TLDs that require [extended attributes](/extended-attributes/).


**Example.**

~~~ js
{
  "domain": {
    "name": "example.com",
    "registrant_id": 100
  }
}
~~~

**Example with extended attributes.**

~~~ js
{
  "domain": {
    "name": "example.us",
    "registrant_id": 100
  },
  "extended_attribute": {
    "us_nexus": "C11",
    "us_purpose": "P3"
  }
}
~~~

### Response

Responds with HTTP 201 on success, returns the domain.

~~~ js
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


## Transfer a domain

Transfer a domain name from another domain registrar into DNSimple.

    POST /domain_transfers

Your account must already be active for this command to complete successfully.
You will be automatically charged the 1 year transfer fee upon successful transfer of the domain,
which may take anywhere from a few minutes up to 7 days.

Only domains that do not require extended attributes may be transferred through the API at this time.
For example, domains ending in `.com` and `.net` may be transferred through the API,
however domains ending in `.us` and `.ca` may not.

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d <data> \
          https://api.dnsimple.com/v1/domain_transfers

### Input

domain.name
: Required _string_

domain.registrant_id
: Required _integer_ The ID of an existing contact in your account.

domain.extended_attribute
: optional _hash_ For TLDs that require [extended attributes](/extended-attributes/).

transfer_order.authinfo
: optional _string_ Required for top-level domains that require an authorization code.


~~~ js
{
  "domain": {
    "name": "transferdomain.com",
    "registrant_id": 1
  },
  "transfer_order": {
    "authinfo": "xjfjfjvhc293"
  }
}
~~~

### Response

Responds with HTTP 201 on success, returns the transfer order.


## Renew a domain

Renew a domain name in your account.

    POST /domain_renewals

Domains will always be renewed for their minimum renewal period,
which is 1 year for most domains but for some domains may be more.

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d <data> \
          https://api.dnsimple.com/v1/domain_renewals

### Input

domain.name
: Required _string_

domain.renew_whois_privacy
: Optional _boolean_


~~~ js
{
  "domain": {
    "name": "renewable.com"
  }
}
~~~

### Response

Responds with HTTP 201 on success, returns the domain.

~~~ js
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


## Transfer out a domain

Prepare a domain for transferring out.

    POST /domains/:domain/transfer_outs

This will unlock a domain and send the authorization code to the domain's administrative contact.

### Parameters

| Name | Type | Description |
| -----|------|-------------|
`:domain` | `string`, `integer` | The domain name or id

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://api.dnsimple.com/v1/domains/:domain/transfer_outs

### Response

Responds with HTTP 201 on success, returns the transfer out order.

