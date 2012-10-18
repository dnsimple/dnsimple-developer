---
title: Email Forwards
---

# Email Forwarding API

Set up [email forwarding](http://support.dnsimple.com/questions/22536-How-do-I-set-up-email-forwarding-with-DNSimple) from your domain to another email account.

* TOC
{:toc}


## List forwards

    GET /domains/:domain/email_forwards

### Example

List email forwards for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/example.com/email_forwards

List email forwards for domain with ID `123`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/123/email_forwards

### Response

~~~ js
[
  {
    "email_forward": {
      "id": 2,
      "domain_id": 20,
      "from": "john@example.com",
      "to": "someone@somedomain.com",
      "created_at": "2012-10-09T14:54:17Z",
      "updated_at": "2012-10-09T14:54:17Z"
    }
  },
  {
    "email_forward": {
      "id": 3,
      "domain_id": 20,
      "from": "bob@example.com",
      "to": "someone@somedomain.com",
      "created_at": "2012-10-09T14:54:17Z",
      "updated_at": "2012-10-09T14:54:17Z"
    }
  }
]
~~~


## Create a forward

    POST /domains/:domain/email_forwards

### Example

Create an email forward for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/domains/example.com/email_forwards

### Input

email_forward.from
: Required _string_

email_forward.to
: Required _string_

~~~ js
{
  "email_forward": {
    "from": "john",
    "to": "someone@example.com"
  }
}
~~~

### Response

Responds with HTTP 201 on success.
Responds with HTTP 400 if the validation fails.

~~~ js
{
  "email_forward": {
    "id": 2,
    "domain_id": 20,
    "from": "john@example.com",
    "to": "someone@somedomain.com",
    "created_at": "2012-10-09T14:51:07Z",
    "updated_at": "2012-10-09T14:51:07Z"
  }
}
~~~


## Delete a forward

    DELETE /domains/:domain/email_forwards/:id

### Example

Delete the email forward with ID `2` for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/example.com/email_forwards/2

### Response

Responds with HTTP 204 on success.
