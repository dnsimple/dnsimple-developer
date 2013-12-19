---
title: Domains
---

# Domain API

* TOC
{:toc}


## List domains

List all domains.

    GET /domains

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains

### Response

Responds with HTTP 200.

~~~ js
[
  {
    "domain": {
      "auto_renew": false,
      "created_at": "2013-01-24T19:23:08Z",
      "expires_on": "2012-03-18",
      "id": 1,
      "language": null,
      "lockable": true,
      "name": "example.com",
      "registrant_id": null,
      "state": "registered",
      "token": "4fIFYWYiJayvL2tkf_mkBkqC4L+4RtYqDA",
      "unicode_name": "example.com",
      "updated_at": "2013-01-24T19:23:08Z",
      "user_id": 1,
      "record_count": 0,
      "service_count": 0,
      "private_whois?": false
    },
  },
  {
    "domain": {
      "auto_renew": false,
      "created_at": "2013-01-24T19:23:08Z",
      "expires_on": "2012-03-18",
      "id": 11,
      "language": null,
      "lockable": true,
      "name": "example2.com",
      "registrant_id": null,
      "state": "registered",
      "token": "4fIFYWYiJayvL2tkf_mkBkqC4L+4RtYqDA",
      "unicode_name": "example.com",
      "updated_at": "2013-01-24T19:23:08Z",
      "user_id": 1,
      "record_count": 0,
      "service_count": 0,
      "private_whois?": false
    }
  }
]
~~~


## Get a domain

    GET /domains/:domain

### Params

:domain
: The _string_ domain name or _integer_ domain id

### Example

Get the domain with ID `1`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/1

Get the domain `example.com`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/example.com

### Response

Responds with HTTP 200, returns the domain.

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


## Create a domain

    POST /domains

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/domains

### Input

domain.name
: Required _string_

~~~ js
{
  "domain": {
    "name": "example.com"
  }
}
~~~

### Response

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.

Responds with HTTP 201 on success, returns the domain.

~~~ js
{
  "domain": {
    "id": 1,
    "user_id": 2,
    "registrant_id": null,
    "name": "example.com",
    "unicode_name": "example.com",
    "lockable": true,
    "auto_renew": false,
    "state": "hosted",
    "language": null,
    "token": "Nv44bvvtYxmpdeu75UVJBrCcCF0Y+2TBMA",
    "created_at": "2013-01-24T19:23:08Z",
    "updated_at": "2012-12-07T14:55:25Z",
    "expires_on": null,
    "record_count": 0,
    "service_count": 0,
    "private_whois?": false
  }
}
~~~


## Delete a domain

<div class="alert">
  <strong>Warning!</strong> There are <a href="/planned-changes/#delete-domainsdomain">planned changes</a> for this API method.
</div>

Delete the given domain from your account.

    DELETE /domains/:domain

Please note that for domains which are registered with DNSimple
this will not delete the domain from the registry.

### Params

:domain
: The _string_ domain name or _integer_ domain id

### Example

Delete the domain with ID `1`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/1

Delete the domain `example.com`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/example.com

### Response

Responds with HTTP 200 on success.

<div class="alert">
  <strong>Warning!</strong> The method will return a blank response in the future, you should not depend on the response body. See <a href="/planned-changes/#delete-domainsdomainrecordsid">planned changes</a>.
</div>


## Reset domain token

    POST /domains/:domain/token

### Params

:domain
: The _string_ domain name or _integer_ domain id

### Example

Reset the token for the domain `example.com`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -X POST \
          -H 'Content-Type: application/json' \
          -d '{}' \
          https://dnsimple.com/domains/example.com/token

### Input

Empty.

### Response

Responds with HTTP 400 if bad request.

Responds with HTTP 200 on success, returns the domain.

~~~ js
{
  "domain": {
    "id": 1,
    "user_id": 2,
    "registrant_id": null,
    "name": "example.com",
    "unicode_name": "example.com",
    "lockable": true,
    "auto_renew": false,
    "state": "hosted",
    "language": null,
    "token": "Nv44bvvtYxmpdeu75UVJBrCcCF0Y+2TBMA",
    "created_at": "2013-01-24T19:23:08Z",
    "updated_at": "2012-12-07T14:55:25Z",
    "expires_on": null,
    "record_count": 0,
    "service_count": 0,
    "private_whois?": false
  }
}
~~~


## Check domain availability

Check if a domain is available for registration.

    GET /domains/:name/check

### Params

:domain
: The _string_ domain name

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/:name/check

### Response

If the domain is available then this will return a 404 which indicates that the
name is available. If it is not available then the response will be a 200.

In either case, the JSON response will contain some additional relevant
information like availability, price, and the minimum number of years you'll
have to reserve the domain for, if you decide to get it.

An available domain looks like this:

~~~ js
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

~~~ js
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

## Move domain to another account

Push a domain from the current DNSimple account to another.

    POST /domains/:domain/push

Once a domain is pushed you will no longer be able to access it through your account.
You will need to acces it using the new account's credentials.

### Params

:domain
: The _string_ domain name or _integer_ domain id

### Example

Move the domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/domains/example.com/push

### Input

push.new_user_email
: Required _string_ email of the new account's email address.

push.contact_id
: Required _integer_ corresponding to the new account's registrant.


~~~ js
{
  "push": {
    "new_user_email": "john@example.com",
    "contact_id": 100
  }
}
~~~

### Response

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.

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
