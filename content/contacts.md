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

    curl  -H "X-DNSimple-Token: <token>" \
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
      "id": 6,
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

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          https://dnsimple.com/contacts/:id

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
    "id": 6,
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

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -X POST \
          -d <json> \
          https://dnsimple.com/contacts

### Input

The following fields are required:

- `contact[first_name]`
- `contact[last_name]`
- `contact[address1]`
- `contact[city]`
- `contact[state_province]`
- `contact[postal_code]`
- `contact[country]`
- `contact[email_address]`
- `contact[phone]`

The following fields are optional:

- `contact[organization_name]`
- `contact[job_title]`
- `contact[fax]`
- `contact[phone_ext]`
- `contact[label]`

If the `contact[organization_name]` is specified then you must also include `contact[job_title]`.

~~~ js
{
  "contact": {
    "first_name": "John",
    "last_name": "Doe",
    "address1": "1 SW 1st Street",
    "city": "Miami",
    "state_province": "FL",
    "postal_code": "33143",
    "country": "US",
    "email_address": "john.doe@gmail.com",
    "phone": "+15551122323",
    "label": "Home"
  }
}
~~~

### Response

~~~ js
TODO
~~~


## Update a contact

    PUT /contacts/:id

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -X PUT \
          -d <json> \
          https://dnsimple.com/contacts/:id

### Input

See "Create a contact".

### Response

~~~ js
TODO
~~~


## Delete a contact

    DELETE /contacts/:id

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -X DELETE \
          https://dnsimple.com/contacts/:id

### Response

~~~ js
TODO
~~~
