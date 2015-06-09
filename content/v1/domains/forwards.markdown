---
title: Email Forwards
excerpt: Welcome to DNSimple. This page is about our API for email forwarding rules. Enjoy low cost hosted DNS, an easy to use web interface, and REST API for automation.
---

# Email Forwarding API

* TOC
{:toc}

Set up email forwarding from your domain to another email account.


## List forwards {#list}

    GET /domains/:domain/email_forwards

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

List email forwards for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/example.com/email_forwards

List email forwards for domain with ID `123`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/123/email_forwards

### Response

~~~js
[
  {
    "email_forward": {
      "id": 2,
      "domain_id": 123,
      "from": "john@example.com",
      "to": "someone@somedomain.com",
      "created_at": "2012-10-09T14:54:17Z",
      "updated_at": "2012-10-09T14:54:17Z"
    }
  },
  {
    "email_forward": {
      "id": 3,
      "domain_id": 123,
      "from": "bob@example.com",
      "to": "someone@somedomain.com",
      "created_at": "2012-10-09T14:54:17Z",
      "updated_at": "2012-10-09T14:54:17Z"
    }
  }
]
~~~


## Create a forward {#create}

    POST /domains/:domain/email_forwards

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

Create an email forward for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v1/domains/example.com/email_forwards

### Input

Name | Type | Description
-----|------|------------
`email_forward.from` | `string` | **Required**. The forward email address, without the domain.
`email_forward.to` | `string` | **Required**. The complete forward email recipient.

~~~js
{
  "email_forward": {
    "from": "john",
    "to": "someone@example.com"
  }
}
~~~

### Response

Responds with HTTP 201 on success.

~~~js
{
  "email_forward": {
    "id": 123,
    "domain_id": 123,
    "from": "john@example.com",
    "to": "someone@somedomain.com",
    "created_at": "2012-10-09T14:51:07Z",
    "updated_at": "2012-10-09T14:51:07Z"
  }
}
~~~

Responds with HTTP 400 if the validation fails.


## Get a forward {#get}

    GET /domains/:domain/email_forwards/:forward

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id
`:forward` | `integer` | The email forward id

### Example

Get the record `2` for domain `example.com`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/example.com/email_forwards/2

### Response

~~~js
{
  "email_forward": {
    "id": 2,
    "domain_id": 123,
    "from": "john@example.com",
    "to": "someone@somedomain.com",
    "created_at": "2012-10-09T14:54:17Z",
    "updated_at": "2012-10-09T14:54:17Z"
  }
}
~~~


## Delete a forward {#delete}

    DELETE /domains/:domain/email_forwards/:forward

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id
`:forward` | `integer` | The email forward id

### Example

Delete the email forward with ID `2` for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/domains/example.com/email_forwards/2

### Response

Responds with HTTP 204 on success.
