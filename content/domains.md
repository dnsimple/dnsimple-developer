---
title: Domains
---

# Domain API

* TOC
{:toc}


## List domains

    GET /domains

### Example

    curl  -H "X-DNSimple-Token: <token>" \
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

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/:id

### Response

~~~ js
{
  "domain": {
    "name": "example.com",
    "expires_at": "3/18/2012 4:07:00 PM",
    "created_at": "2010-10-03T11:38:04Z",
    "registration_status": "registered",
    "updated_at": "2010-10-28T10:00:17Z",
    "registrant_id": 1,
    "id": 1,
    "user_id": 1,
    "name_server_status": "active"
  }
}
~~~


## Create a domain

    POST /domains

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -d <json> \
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

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
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

    curl  -H "X-DNSimple-Token: <token>" \
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
