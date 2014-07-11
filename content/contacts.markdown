---
title: Contacts
---

# Contact API

Contacts are used for domain registrant information when a domain is registered
with DNSimple or transferred into DNSimple from another registrar.

* TOC
{:toc}


## List contacts

    GET /contacts

### Example

List all contacts.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/contacts

### Response

~~~js
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


## Get a contact

    GET /contacts/:id

### Example

Get the contact with ID `123`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/contacts/123

### Response

~~~js
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


## Create a contact

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

contact.first_name
: Required _string_

contact.last_name
: Required _string_

contact.organization_name
: Optional _string_ representing the organization/company name.
  If the `organization_name` is specified, then you must also include `job_title`.

contact.job_title
: Optional _string_

contact.address1
: Required _string_

contact.city
: Required _string_

contact.state_province
: Required _string_

contact.postal_code
: Required _string_

contact.country
: Required _string_

contact.email_address
: Required _string_

contact.phone
: Required _string_

contact.fax
: Optional _string_

contact.label
: Optional _string_

~~~js
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

Responds with HTTP 400 if the validation fails.

Responds with HTTP 201 on success.

~~~js
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


## Update a contact

    PUT /contacts/:id

### Example

Update the contact with ID `123`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT \
          -d '<json>' \
          https://api.dnsimple.com/v1/contacts/123

### Input

See [Create a contact](#create-a-contact).

### Response

Responds with HTTP 400 if the validation fails.

Responds with HTTP 200 on success.

~~~js
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


## Delete a contact

    DELETE /contacts/:id

### Example

Delete the contact with ID `123`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/contacts/123

### Response

Responds with HTTP 204 on success.
