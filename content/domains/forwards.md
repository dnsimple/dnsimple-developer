---
title: Email Forwards
---

# Email Forwarding API

Set up [email forwarding](http://support.dnsimple.com/questions/22536-How-do-I-set-up-email-forwarding-with-DNSimple) from your domain to another email account.

* TOC
{:toc}


## Create a forward

    POST /domains/:domain/email_forwards

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -d <json> \
          https://dnsimple.com/domains/:domain/email_forwards

### Input

~~~ js
{
  "email_forward": {
    "from": "john",
    "to": "someone@example.com"
  }
}
~~~

### Response

~~~ js
TODO
~~~


## Delete a forward

    DELETE /domains/:domain/email_forwards/:id

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -X DELETE \
          https://dnsimple.com/domains/:domain/email_forwards/:id

### Response

~~~ js
TODO
~~~
