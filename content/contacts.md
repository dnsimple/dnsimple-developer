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
          https://dnsimple.com/contacts

### Response

~~~ js
[
  {
    "contact": {
      "city": "Miami",
      "address1": "2834 SW 88th Ave",
      "state_province": "FL",
      "created_at": "2010-08-24T01:58:22Z",
      "address2": "",
      "job_title": "",
      "country": "US",
      "updated_at": "2010-08-24T01:58:22Z",
      "postal_code": "33546",
      "organization_name": "",
      "id": 1,
      "user_id": 1,
      "phone_ext": null,
      "phone": "+13051123333",
      "last_name": "Doe",
      "fax": null,
      "email_address": "jane.doe@gmail.com",
      "first_name": "Jane"
    }
  },
  {
    "contact": {
      "city": "Miami",
      "address1": "1000 SW 1st Street",
      "state_province": "FL",
      "created_at": "2010-09-03T20:11:51Z",
      "address2": "",
      "job_title": "President",
      "country": "US",
      "updated_at": "2010-09-03T20:11:51Z",
      "postal_code": "33143",
      "organization_name": "Little Co Inc.",
      "id": 123,
      "user_id": 1,
      "phone_ext": null,
      "phone": "505 111 2222",
      "last_name": "Smith",
      "fax": null,
      "email_address": "john.smith@example.com",
      "first_name": "John"
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
          https://dnsimple.com/contacts/123

### Response

~~~ js
{
  "contact": {
    "city": "Miami",
    "address1": "1000 SW 1st Street",
    "state_province": "FL",
    "created_at": "2010-09-03T20:11:51Z",
    "address2": "",
    "job_title": "President",
    "country": "US",
    "updated_at": "2010-09-03T20:11:51Z",
    "postal_code": "33143",
    "organization_name": "Little Co Inc.",
    "id": 123,
    "user_id": 1,
    "phone_ext": null,
    "phone": "505 111 2222",
    "last_name": "Smith",
    "fax": null,
    "email_address": "john.smith@example.com",
    "first_name": "John"
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
          https://dnsimple.com/contacts

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

contact.phone_ext
: Optional _string_

contact.fax
: Optional _string_

contact.label
: Optional _string_

~~~ js
{
  "contact": {
    "first_name": "John",
    "last_name": "Smith",
    "address1": "1000 SW 1st Street",
    "city": "Miami",
    "state_province": "FL",
    "postal_code": "33143",
    "country": "US",
    "email_address": "john.smith@example.com",
    "phone": "505 111 2222",
    "organization_name": "Little Co Inc.",
    "job_title": "President",
    "label": "Office"
  }
}
~~~

### Response

Responds with HTTP 400 if the validation fails.

Responds with HTTP 201 on success.

~~~ js
{
  "contact": {
    "city": "Miami",
    "address1": "1000 SW 1st Street",
    "state_province": "FL",
    "created_at": "2010-09-03T20:11:51Z",
    "address2": "",
    "job_title": "President",
    "country": "US",
    "updated_at": "2010-09-03T20:11:51Z",
    "postal_code": "33143",
    "organization_name": "Little Co Inc.",
    "id": 123,
    "user_id": 1,
    "phone_ext": null,
    "phone": "505 111 2222",
    "last_name": "Smith",
    "fax": null,
    "email_address": "john.smith@example.com",
    "first_name": "John"
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
          https://dnsimple.com/contacts/123

### Input

See [Create a contact](#create-a-contact).

### Response

Responds with HTTP 400 if the validation fails.

Responds with HTTP 200 on success.

~~~ js
{
  "contact": {
    "city": "Miami",
    "address1": "1000 SW 1st Street",
    "state_province": "FL",
    "created_at": "2010-09-03T20:11:51Z",
    "address2": "",
    "job_title": "President",
    "country": "US",
    "updated_at": "2010-09-03T20:11:51Z",
    "postal_code": "33143",
    "organization_name": "Little Co Inc.",
    "id": 123,
    "user_id": 1,
    "phone_ext": null,
    "phone": "505 111 2222",
    "last_name": "Smith",
    "fax": null,
    "email_address": "john.smith@example.com",
    "first_name": "John"
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
          https://dnsimple.com/contacts/123

### Response

Responds with HTTP 204 on success.
