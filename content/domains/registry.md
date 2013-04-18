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
          https://dnsimple.com/domain_registrations

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
    "name": "newdomain.com",
    "registrant_id": 1
  }
}
~~~

**Example with extended attributes.**

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

<!-- TODO
~~~ js
TODO
~~~
-->


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
          https://dnsimple.com/domain_transfers

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

Upon successful issuance of the transfer order the response code will be a 201
and the response body will contain the transfer order details.

<!-- TODO
~~~ js
TODO
~~~
-->


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
          https://dnsimple.com/domain_renewals

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

<!-- TODO
### Response

~~~ js
~~~
-->


## Transfer out a domain

Prepare a domain for transferring out.

    POST /domains/:domain/transfer_outs

This will unlock a domain and send the authorization code to the domain's administrative contact.

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://dnsimple.com/domains/:domain/transfer_outs

<!-- TODO
### Response

~~~ js
~~~
-->
