---
title: Domain Registry
---

# Domain Registry API

* TOC
{:toc}


## Register a domain {#register}

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

| Name | Type | Description |
|------|------|-------------|
`domain.name` | `string` | **Required**.
`domain.registrant_id` | `integer` | **Required**. The ID of an existing contact in your account.
`extended_attribute` | `hash` | **Required** for TLDs that require [extended attributes](/extended-attributes/).

##### Example

~~~js
{
  "domain": {
    "name": "example.com",
    "registrant_id": 100
  }
}
~~~

##### Example with extended attributes

~~~js
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

~~~js
{
  "domain": {
    "id": 227,
    "user_id": 19,
    "registrant_id": 100,
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


## Transfer a domain {#transfer}

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

| Name | Type | Description |
|------|------|-------------|
`domain.name` | `string` | **Required**.
`domain.registrant_id` | `integer` | **Required**. The ID of an existing contact in your account.
`extended_attribute` | `hash` | **Required** for TLDs that require [extended attributes](/extended-attributes/).
`transfer_order.authinfo` | `string` | **Required** for top-level domains that require an authorization code.

##### Example

~~~js
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

##### Example with extended attributes

~~~js
{
  "domain": {
    "name": "transferdomain.com",
    "registrant_id": 1
  },
  "transfer_order": {
    "authinfo": "xjfjfjvhc293"
  }
  "extended_attribute": {
    "us_nexus": "C11",
    "us_purpose": "P3"
  }
}
~~~

### Response

Responds with HTTP 201 on success, returns the transfer order.


## Renew a domain {#renew}

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

| Name | Type | Description |
|------|------|-------------|
`domain.name` | `string` | **Required**.
`domain.renew_whois_privacy` | `boolean` | Set to `true` to also renew the associated Whois Privacy. Default: `false`.

##### Example

~~~js
{
  "domain": {
    "name": "example.com"
  }
}
~~~

### Response

Responds with HTTP 201 on success, returns the domain.

~~~js
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


## Transfer out a domain {#transfer-out}

Prepare a domain for transferring out.

    POST /domains/:domain/transfer_outs

This will unlock a domain and send the authorization code to the domain's administrative contact.

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

Transfer out the domain with ID `1`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://api.dnsimple.com/v1/domains/1/transfer_outs

Transfer out the domain `example.com`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://api.dnsimple.com/v1/domains/example.com/transfer_outs

### Response

Responds with HTTP 201 on success, returns the transfer out order.


## Check domain availability {#check}

Check if a domain is available for registration.

    GET /domains/:name/check

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string` | The domain name

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/:name/check

### Response

If the domain is available then this will return a 404 which indicates that the
name is available. If it is not available then the response will be a 200.

In either case, the JSON response will contain some additional relevant
information like availability, price, and the minimum number of years you'll
have to reserve the domain for, if you decide to get it.

An available domain looks like this:

~~~js
// 404 Not Found
{
  "name":"available-domain.com",
  "status":"available",
  "price":"14.0",
  "currency":"USD",
  "currency_symbol":"$",
  "minimum_number_of_years":1
}
~~~

An unavailable domain looks like this:

~~~js
// 200 OK
{
  "name":"somebody-already-has-it.com",
  "status":"unavailable",
  "price":"14.0",
  "currency":"USD",
  "currency_symbol":"$",
  "minimum_number_of_years":1
}
~~~
