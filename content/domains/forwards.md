---
title: Email Forwards
---

# Email Forwarding API

Set up email forwarding from your domain to another email account.

* TOC
{:toc}


## List forwards {#list}

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


## Create a forward {#create}

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

| Name | Type | Description |
|------|------|-------------|
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


## Delete a forward {#delete}

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
