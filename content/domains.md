---
title: Domains
---

# Domain API

* TOC
{:toc}


## List domains

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
      "name": "example1.com",
      "expires_at": "3/18/2012 4:07:00 PM",
      "created_at": "2010-10-03T11:38:04Z",
      "registration_status": "registered",
      "updated_at": "2010-10-28T10:00:17Z",
      "registrant_id": 1,
      "id": 1,
      "user_id": 1,
      "name_server_status": "active"
     }
  },
  {
    "domain": {
      "name": "example2.com",
      "expires_at": "8/17/2013 8:57:00 PM",
      "created_at": "2010-07-05T02:43:40Z",
      "registration_status": "registered",
      "updated_at": "2010-10-21T16:10:26Z",
      "registrant_id": 1,
      "id": 2,
      "user_id": 1,
      "name_server_status": "active"
     }
  },
  {
    "domain": {
      "name": "example3.com",
      "expires_at": "7/10/2013 7:37:00 PM",
      "created_at": "2010-07-01T07:46:17Z",
      "registration_status": "registered",
      "updated_at": "2010-10-21T15:47:47Z",
      "registrant_id": 1,
      "id": 3,
      "user_id": 1,
      "name_server_status": "active"
     }
  }
]
~~~


## Get a domain

    GET /domains/:id

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/:id

### Response

~~~ js
{
  "domain": {
    "auto_renew": null,
    "created_at": "2012-09-21T21:15:19Z",
    "expires_at": "3/18/2012 4:07:00 PM",
    "id": 123,
    "language": null,
    "lockable": true,
    "name": "example.com",
    "name_server_status": "active",
    "parsed_expiration_date": "2012-03-18T04:07:00Z",
    "registrant_id": 1,
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

The following fields are required:

- `domain[name]`

~~~ js
{
  "domain": {
    "name": "newdomain.com"
  }
}
~~~

### Response

~~~ js
TODO
~~~


## Delete a domain

Delete the given domain from your account.

    DELETE /domains/:id

Please note that for domains which are registered with DNSimple
this will not delete the domain from the registry.

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/:id

### Response

~~~ js
TODO
~~~


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


## Transfer out a domain

Prepare a domain for transferring out.

    POST /domains/:id/transfer_outs

This will unlock a domain and send the authorization code to the domain's administrative contact.

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://dnsimple.com/domains/:id/transfer_outs

### Response

~~~ js
TODO
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

Move domain with ID `123`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/domains/123/push

### Input

push.new_user_email
: Required _string_ email of the new account's email address.

push.contact_id
: Required _integer_ corresponding to the new account's registrant.


~~~ js
{
  "push": {
    "new_user_email": "john@example.com",
    "contact_id": 1234
  }
}
~~~

### Response


Responds with HTTP 200 on success.

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.

~~~ js
{
  "domain": {
    "auto_renew": null,
    "created_at": "2012-09-21T21:15:19Z",
    "expires_at": "3/18/2012 4:07:00 PM",
    "id": 123,
    "language": null,
    "lockable": true,
    "name": "example.com",
    "name_server_status": "active",
    "parsed_expiration_date": "2012-03-18T04:07:00Z",
    "registrant_id": 1234,
    "state": "registered",
    "token": "Nv44bvvtYxmpdeu75UVJBrCcCF0Y+2TBMA",
    "unicode_name": "example.com",
    "updated_at": "2012-12-07T14:55:25Z",
    "user_id": 4,
    "uses_external_name_servers": null,
    "record_count": 0,
    "service_count": 0,
    "private_whois?": false
  }
}
~~~
