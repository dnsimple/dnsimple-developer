---
title: Domain Sharing
---

# Domain Sharing API

* TOC
{:toc}


## List memberships {#list}

    GET /domains/:domain/memberships

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

List memberships for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/example.com/memberships

List memberships for domain with ID `123`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/123/memberships

### Response

~~~js
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


## Add a membership {#create}

    POST /domains/:domain/memberships

If the person already exists in DNSimple as a customer then he will immediately be added to the domain's membership list. If the person does not yet have a DNSimple account then he will receive an invitation to join via email.

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

Add a membership for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v1/domains/example.com/memberships


### Input

| Name | Type | Description |
|------|------|-------------|
`membership.email` | `string` | **Required** email address for the person to add.

~~~js
{
  "membership": {
    "email": "john.smith@example.com"
  }
}
~~~

### Response

Responds with HTTP 201 on success.

~~~js
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

Responds with HTTP 400 if the validation fails.


## Delete a membership {#delete}

    DELETE /domains/:domain/memberships/:membership

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id
`:membership` | `string`, `integer` | The member email or id

### Example

Delete the membership with ID `712` for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/domains/example.com/memberships/712

Delete the membership with email `member@example.com` for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/domains/example.com/memberships/member@example.com

### Response

Responds with HTTP 204 on success.
