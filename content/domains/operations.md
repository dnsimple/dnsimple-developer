---
title: Domain Operations
---

# Domain Operation API

* TOC
{:toc}


## Register a domain

Register a domain name with DNSimple and the appropriate domain registry.

    POST /domain_registrations

Your account must already be active for this command to complete successfully.
You will be automatically charged the 1 year registration fee upon successful registration,
so please be careful with this command.

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -X POST \
          -d <data> \
          https://dnsimple.com/domain_registrations

### Input

The following fields are required:

- `domain[name]`
- `domain[registrant_id]`

`domain[registrant_id]` is the ID of an existing contact in your account.

For TLDs that require [extended attributes](/extended-attributes/),
you must also include `extended_attribute`:

- `domain[extended_attribute][]`

Example.

~~~ js
{
  "domain": {
    "name": "newdomain.com",
    "registrant_id": 1
  }
}
~~~

Example with extended attributes.

~~~ js
{
  "domain": {
    "name": "newdomain.us",
    "registrant_id": 1,
    "extended_attribute": {
      "us_nexus": "C11",
      "us_purpose": "P3"
    }
  }
}
~~~

### Response

Upon successful creation of the domain the response code will be a 201
and the response body will contain the domain details.

~~~ js
TODO
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

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -X POST \
          -d <data> \
          https://dnsimple.com/domain_transfers

### Input

The following fields are required:

- `domain[name]`
- `domain[registrant_id]`

For top-level domains that require an authorization code,
you must include the following:

- `transfer_order[authinfo]`

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

Upon successful issuance of the transfer order the response code will be a 201
and the response body will contain the transfer order details.

~~~ js
TODO
~~~


## Renew a domain

Renew a domain name in your account.

    POST /domain_renewal

Domains will always be renewed for their minimum renewal period,
which is 1 year for most domains but for some domains may be more.

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -X POST \
          -d <data> \
          https://dnsimple.com/domain_renewal

### Input

The following fields are required:

- `domain[name]`

The following fields are optional:

- `domain[renew_whois_privacy]`

~~~ js
{
  "domain": {
    "name": "renewable.com"
  }
}
~~~

### Response

~~~ js
TODO
~~~

