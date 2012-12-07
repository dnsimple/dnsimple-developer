---
title: Domain Sharing
---

# Domain sharing API

* TOC
{:toc}


## List memberships

    GET /domains/:domain/memberships

### Example

List memberships for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/example.com/memberships

List memberships for domain with ID `123`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/123/memberships

### Response

~~~ js
[
  {
    "membership": {
      "id": 712,
      "domain_id": 123,
      "user_id": 1560,
      "permission": "manage",
      "created_at": "2012-10-18T11:38:20Z",
      "updated_at": "2012-10-18T11:38:20Z"
    }
  },
  {
    "membership": {
      "id": 715,
      "domain_id": 123,
      "user_id": 1120,
      "permission": "manage",
      "created_at": "2012-10-18T11:41:41Z",
      "updated_at": "2012-10-18T11:41:41Z"
    }
  }
]
~~~


## Add a membership

    POST /domains/:domain/memberships

### Example

Add a membership for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/domains/example.com/memberships

### Input

membership.email
: Required _string_ address for the person to add.
  If the person already exists in DNSimple as a customer then he will immediately be added to the domain's membership list.
  If the person does not yet have a DNSimple account then he will receive an invitation to join via email.

~~~ js
{
  "membership": {
    "email": "john.smith@example.com"
  }
}
~~~

### Response

Responds with HTTP 201 on success.
Responds with HTTP 400 if the validation fails.

~~~ js
{
  "membership": {
    "id": 712,
    "domain_id": 123,
    "user_id": 1560,
    "permission": "manage",
    "created_at": "2012-10-18T11:38:20Z",
    "updated_at": "2012-10-18T11:38:20Z"
  }
}
~~~


## Delete a membership

    DELETE /domains/:domain/memberships/:membership

### Example

Delete the membership with ID `712` for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/example.com/memberships/712

Delete the membership with email `member@example.com` for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/example.com/memberships/member@example.com

### Response

Responds with HTTP 204 on success.
