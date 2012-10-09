---
title: Email Forwards
---

# Email Forwarding API

Set up [email forwarding](http://support.dnsimple.com/questions/22536-How-do-I-set-up-email-forwarding-with-DNSimple) from your domain to another email account.

* TOC
{:toc}


## Create a forward

Create an email forward for domain `example.com`:

    POST /domains/:domain/email_forwards

### Example

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
    "to": "someone@example.com",
    "created_at": "2012-10-09T14:51:07Z",
    "updated_at": "2012-10-09T14:51:07Z"
  }
}
~~~


## Delete a forward

Delete the an email forward `2` for domain `example.com`:

    DELETE /domains/:domain/email_forwards/:id

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/example.com/email_forwards/2

### Response

Responds with HTTP 204 on success.
