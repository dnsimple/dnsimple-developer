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

~~~ js
[
  {
    "domain": {
      "auto_renew": null,
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
      "auto_renew": null,
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

~~~ js
{
  "domain": {
    "auto_renew": null,
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

Responds with HTTP 201 on success.

~~~ js
{
  "domain": {
    "auto_renew": null,
    "created_at": "2013-01-24T19:23:08Z",
    "expires_on": null,
    "id": 1,
    "language": null,
    "lockable": true,
    "name": "example.com",
    "registrant_id": null,
    "state": "hosted",
    "token": "4fIFYWYiJayvL2tkf_mkBkqC4L+4RtYqDA",
    "unicode_name": "example.com",
    "updated_at": "2013-01-24T19:23:08Z",
    "user_id": 1,
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


## Check domain availability

Check if a domain is available for registration.

    GET /domains/:name/check

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/:name/check

### Response

If the domain is available then this will return a 404 which indicates
that the name is available. If it is not available then the response will be a 200.

In addition the body of the response will contain the domain name
that was checked along with a status string.

~~~ js
{
  "name": "available-domain.com",
  "status": "available"
}
~~~


## Move domain to another account

Push a domain from the current DNSimple account to another.

    POST /domains/:domain/push

Once a domain is pushed you will no longer be able to access it through your account.
You will need to acces it using the new account's credentials.

### Example

Move domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/domains/example.com/push

Move domain with ID `1`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/domains/1/push

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

Responds with HTTP 200 on success.

~~~ js
{
  "domain": {
    "auto_renew": null,
    "created_at": "2013-01-24T19:23:08Z",
    "expires_on": "2012-03-18",
    "id": 1,
    "language": null,
    "lockable": true,
    "name": "example.com",
    "registrant_id": 100,
    "state": "registered",
    "token": "Nv44bvvtYxmpdeu75UVJBrCcCF0Y+2TBMA",
    "unicode_name": "example.com",
    "updated_at": "2012-12-07T14:55:25Z",
    "user_id": 1,
    "uses_external_name_servers": null,
    "record_count": 0,
    "service_count": 0,
    "private_whois?": false
  }
}
~~~
