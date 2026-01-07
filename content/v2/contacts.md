---
title: Contacts API | DNSimple API v2
excerpt: This page documents the DNSimple contacts API v2.
---

# Contacts API

* TOC
{:toc}


## Contact attributes {#contact-attributes}

Please refer to the definition of the `Contact` data type in [our OpenAPI documentation](/v2/openapi.yml).


## List contacts {#listContacts}

~~~
GET /:account/contacts
~~~

List contacts in the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort contacts by ID
`label` | Sort contacts by label (alphabetical order)
`email` | Sort contacts by email (alphabetical order)

The default sorting policy is by ascending `id`.

### Example

List all contacts in the account `1010`:

~~~
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/1010/contacts
~~~

### Response

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/listContacts/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.


## Create a contact {#createContact}

~~~
POST /:account/contacts
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

Create a contact in the account `1010`:

~~~
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      -H 'Content-Type: application/json' \
      -X POST \
      -d '<json>' \
      https://api.dnsimple.com/v2/1010/contacts
~~~

### Input

Name | Type | Description
-----|------|------------
`label`             | `string` |
`first_name`        | `string` | **Required**.
`last_name`         | `string` | **Required**.
`organization_name` | `string` | The company name. If the `organization_name` is specified, then you must also include `job_title`.
`job_title`         | `string` |
`address1`          | `string` | **Required**.
`address2`          | `string` |
`city`              | `string` | **Required**.
`state_province`    | `string` | **Required**.
`postal_code`       | `string` | **Required**.
`country`           | `string` | **Required**. The ISO 3166-1 alpha-2 country code, upper case (eg. DE).
`email`             | `string` | **Required**.
`phone`             | `string` | **Required**.
`fax`               | `string` |

##### Example

~~~json
{
  "label": "Default",
  "first_name": "First",
  "last_name": "User",
  "job_title": "CEO",
  "organization_name": "Awesome Company",
  "email": "first@example.com",
  "phone": "+18001234567",
  "fax": "+18011234567",
  "address1": "Italian Street, 10",
  "city": "Roma",
  "state_province": "RM",
  "postal_code": "00100",
  "country": "IT"
}
~~~

### Response

Responds with HTTP 201 on success.

~~~json
<%= pretty_print_fixture("/api/createContact/created.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the contact cannot be created.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.


## Retrieve a contact {#getContact}

~~~
GET /:account/contacts/:contact
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:contact` | `integer` | The contact id

### Example

Get the contact with ID `1` in the account `1010`:

~~~
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/1010/contacts/1
~~~

### Response

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/getContact/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Update a contact {#updateContact}

~~~
PATCH /:account/contacts/:contact
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:contact` | `integer` | The contact id

### Example

Update the contact with ID `1` in the account `1010`:

~~~
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      -H 'Content-Type: application/json' \
      -X PATCH \
      -d '<json>' \
      https://api.dnsimple.com/v2/1010/contacts/1
~~~

### Input

See [create](#create).

### Response

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/updateContact/success.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the contact cannot be updated.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Delete a contact {#deleteContact}

~~~
DELETE /:account/contacts/:contact
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:contact` | `integer` | The contact id

### Example

Delete the contact with ID `1` in the account `1010`:

~~~
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      -H 'Content-Type: application/json' \
      -X DELETE \
      https://api.dnsimple.com/v2/1010/contacts/1
~~~

### Response

Responds with HTTP 204 on success.

~~~json
<%= pretty_print_fixture("/api/deleteContact/error-contact-in-use.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the contact cannot be deleted.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.