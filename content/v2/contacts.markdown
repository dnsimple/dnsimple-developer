---
title: Contacts | DNSimple API v2
excerpt: This page documents the DNSimple contacts API v2.
---

# Contacts API

* TOC
{:toc}


## List contacts {#list}

    GET /:account/contacts

List contacts for the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

List all contacts for the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/contacts

### Response

Responds with HTTP 200.

~~~json
[
  {},
  {}
]
~~~


## Create a contact {#create}

    POST /:account/contacts

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

Create a contact in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/contacts

### Input

Name | Type | Description
-----|------|------------
`label`             | `string` |
`first_name`        | `string` | **Required**.
`last_name`         | `string` | **Required**.
`address1`          | `string` | **Required**.
`city`              | `string` | **Required**.
`state_province`    | `string` | **Required**.
`postal_code`       | `string` | **Required**.
`country`           | `string` | **Required**.
`email_address`     | `string` | **Required**.
`phone`             | `string` | **Required**.
`fax`               | `string` | **Required**.
`organization_name` | `string` | The company name. If the `organization_name` is specified, then you must also include `job_title`.
`job_title`         | `string` |

##### Example

~~~json
{}
~~~

### Response

Responds with HTTP 201 on success.

~~~json
{}
~~~

Responds with HTTP 400 if the validation fails.


## Get a contact {#get}

    GET /:account/contacts/:contact

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:contact` | `integer` | The contact id

### Example

Get the contact with ID `1`.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/_/contacts/1

### Response

~~~json
{}
~~~


## Update a contact {#update}

    PATCH /:account/contacts/:contact

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:contact` | `integer` | The contact id

### Example

Update the contact with ID `1`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PATCH \
          -d '<json>' \
          https://api.dnsimple.com/v2/_/contacts/1

### Input

See [create](#create).

### Response

Responds with HTTP 200 on success.

~~~json
{}
~~~

Responds with HTTP 400 if the validation fails.


## Delete a contact {#delete}

    DELETE /:account/contacts/:contact

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:contact` | `integer` | The contact id

### Example

Delete the contact with ID `1`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/_/contacts/1

### Response

Responds with HTTP 204 on success.
