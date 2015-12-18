---
title: Contacts
excerpt: This page documents the DNSimple Contacts API v1.
---

# Contact API

* TOC
{:toc}

Contacts are used for domain registrant information when a domain is registered
with DNSimple or transferred into DNSimple from another registrar.


## List contacts {#list}

    GET /contacts

### Example

List all contacts.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/contacts

### Response

~~~json
[
  {
    "contact": {
      "id": 28,
      "user_id": 19,
      "label": "Simone",
      "first_name": "Simone",
      "last_name": "Carletti",
      "job_title": "Underwater Programmer",
      "organization_name": "DNSimple",
      "email_address": "simone.carletti@dnsimple.com",
      "phone": "+1 111 4567890",
      "fax": "+1 222 4567890",
      "address1": "Awesome Street",
      "address2": "c/o Someone",
      "city": "Rome",
      "state_province": "RM",
      "postal_code": "00171",
      "country": "IT",
      "created_at": "2014-01-15T22:08:07.390Z",
      "updated_at": "2014-01-15T22:08:07.390Z"
    }
  },
  {
    "contact": {
      "id": 28,
      "user_id": 19,
      "label": "Simone",
      "first_name": "Simone",
      "last_name": "Carletti",
      "job_title": "Underwater Programmer",
      "organization_name": "DNSimple",
      "email_address": "simone.carletti@dnsimple.com",
      "phone": "+1 111 4567890",
      "fax": "+1 222 4567890",
      "address1": "Awesome Street",
      "address2": "c/o Someone",
      "city": "Rome",
      "state_province": "RM",
      "postal_code": "00171",
      "country": "IT",
      "created_at": "2014-01-15T22:08:07.390Z",
      "updated_at": "2014-01-15T22:08:07.390Z"
    }
  }
]
~~~


## Create a contact {#create}

    POST /contacts

### Example

Create a contact.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v1/contacts

### Input

Name | Type | Description
-----|------|------------
`contact.label` | `string` |
`contact.first_name` | `string` | **Required**.
`contact.last_name` | `string` | **Required**.
`contact.organization_name` | `string` | The organization/company name. If the `organization_name` is specified, then you must also include `job_title`.
`contact.job_title` | `string` |
`contact.address1` | `string` | **Required**.
`contact.city` | `string` | **Required**.
`contact.state_province` | `string` | **Required**.
`contact.postal_code` | `string` | **Required**.
`contact.country` | `string` | **Required**.
`contact.email_address` | `string` | **Required**.
`contact.phone` | `string` | **Required**.
`contact.fax` | `string` | **Required**.

~~~json
{
  "contact": {
    "label": "Simone",
    "first_name": "Simone",
    "last_name": "Carletti",
    "job_title": "Underwater Programmer",
    "organization_name": "DNSimple",
    "email_address": "simone.carletti@dnsimple.com",
    "phone": "+1 111 4567890",
    "fax": "+1 222 4567890",
    "address1": "Awesome Street",
    "address2": "c/o Someone",
    "city": "Rome",
    "state_province": "RM",
    "postal_code": "00171",
    "country": "IT",
  }
}
~~~

### Response

Responds with HTTP 201 on success.

~~~json
{
  "contact": {
    "id": 28,
    "user_id": 19,
    "label": "Simone",
    "first_name": "Simone",
    "last_name": "Carletti",
    "job_title": "Underwater Programmer",
    "organization_name": "DNSimple",
    "email_address": "simone.carletti@dnsimple.com",
    "phone": "+1 111 4567890",
    "fax": "+1 222 4567890",
    "address1": "Awesome Street",
    "address2": "c/o Someone",
    "city": "Rome",
    "state_province": "RM",
    "postal_code": "00171",
    "country": "IT",
    "created_at": "2014-01-15T22:08:07.390Z",
    "updated_at": "2014-01-15T22:08:07.390Z"
  }
}
~~~

Responds with HTTP 400 if the validation fails.


## Get a contact {#get}

    GET /contacts/:id

### Parameters

Name | Type | Description
-----|------|------------
`:id` | `integer` | The contact id

### Example

Get the contact with ID `123`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/contacts/123

### Response

~~~json
{
  "contact": {
    "id": 28,
    "user_id": 19,
    "label": "Simone",
    "first_name": "Simone",
    "last_name": "Carletti",
    "job_title": "Underwater Programmer",
    "organization_name": "DNSimple",
    "email_address": "simone.carletti@dnsimple.com",
    "phone": "+1 111 4567890",
    "fax": "+1 222 4567890",
    "address1": "Awesome Street",
    "address2": "c/o Someone",
    "city": "Rome",
    "state_province": "RM",
    "postal_code": "00171",
    "country": "IT",
    "created_at": "2014-01-15T22:08:07.390Z",
    "updated_at": "2014-01-15T22:08:07.390Z"
  }
}
~~~


## Update a contact {#update}

    PUT /contacts/:id

### Parameters

Name | Type | Description
-----|------|------------
`:id` | `integer` | The contact id

### Example

Update the contact with ID `123`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT \
          -d '<json>' \
          https://api.dnsimple.com/v1/contacts/123

### Input

See [create](#create).

### Response

Responds with HTTP 200 on success.

~~~json
{
  "contact": {
    "id": 28,
    "user_id": 19,
    "label": "Simone",
    "first_name": "Simone",
    "last_name": "Carletti",
    "job_title": "Underwater Programmer",
    "organization_name": "DNSimple",
    "email_address": "simone.carletti@dnsimple.com",
    "phone": "+1 111 4567890",
    "fax": "+1 222 4567890",
    "address1": "Awesome Street",
    "address2": "c/o Someone",
    "city": "Rome",
    "state_province": "RM",
    "postal_code": "00171",
    "country": "IT",
    "created_at": "2014-01-15T22:08:07.390Z",
    "updated_at": "2014-01-15T22:08:07.390Z"
  }
}
~~~

Responds with HTTP 400 if the validation fails.


## Delete a contact {#delete}

    DELETE /contacts/:id

### Parameters

Name | Type | Description
-----|------|------------
`:id` | `integer` | The contact id

### Example

Delete the contact with ID `123`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/contacts/123

### Response

Responds with HTTP 204 on success.
