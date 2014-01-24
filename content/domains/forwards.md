---
title: Email Forwards
---

# Email Forwarding API

Set up email forwarding from your domain to another email account.

* TOC
{:toc}


## List forwards

    GET /domains/:domain/email_forwards

### Parameters

| Name | Type | Description |
| -----|------|-------------|
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


## Create a forward

    POST /domains/:domain/email_forwards

### Parameters

| Name | Type | Description |
| -----|------|-------------|
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

email_forward.from
: Required _string_

email_forward.to
: Required _string_

~~~js
{
  "email_forward": {
    "from": "john",
    "to": "someone@example.com"
  }
}
~~~

### Response

Responds with HTTP 400 if the validation fails.

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


## Delete a forward

    DELETE /domains/:domain/email_forwards/:id

### Parameters

| Name | Type | Description |
| -----|------|-------------|
`:domain` | `string`, `integer` | The domain name or id

### Example

Delete the email forward with ID `123` for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/domains/example.com/email_forwards/123

### Response

Responds with HTTP 204 on success.
