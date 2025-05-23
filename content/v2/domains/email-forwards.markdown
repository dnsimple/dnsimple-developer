---
title: Email forwards API | Domains | DNSimple API v2
excerpt: This page documents the DNSimple email forwards API v2.
---

# Email forwards API

* TOC
{:toc}


## Email Forward attributes {#email-forward-attributes}

Please refer to the definition of the `EmailForward` data type in [our OpenAPI documentation](/v2/openapi.yml).


## List email forwards {#listEmailForwards}

    GET /:account/domains/:domain/email_forwards

List email forwards for the domain in the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort email forwards by ID
`from` | Sort email forwards by sender (alphabetical order)
`to` | Sort email forwards by recipient (alphabetical order)

The default sorting policy is by ascending `id`.

### Example

List all email forwards for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/email_forwards

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/api/listEmailForwards/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Create an email forward {#createEmailForward}

    POST /:account/domains/:domain/email_forwards

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Create an email forward under the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/domains/example.com/email_forwards

### Input

Name | Type | Description
-----|------|------------
`alias_name` | `string` | **Required**. The receiving email recipient, the name part only without the domain. The domain is automatically appended.
`destination_email` | `string` | **Required**. The email recipient the messages are delivered to.

##### Example

~~~json
{
  "alias_name": "john.doe",
  "destination_email": "john@another.com"
}
~~~

### Response

Responds with HTTP 201 on success, renders the email forward.

~~~json
<%= pretty_print_fixture("/api/createEmailForward/created.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the email forward cannot be created.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Retrieve an email forward {#getEmailForward}

    GET /:account/domains/:domain/email_forwards/:email_forward

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:email_forward` | `integer` | The email forward id

### Example

Get the email forward with the ID `1` in the domain `example.com`, in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/email_forwards/1

### Response

Responds with HTTP 200, renders the email forward.

~~~json
<%= pretty_print_fixture("/api/getEmailForward/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.


## Delete an email forward {#deleteEmailForward}

    DELETE /:account/domains/:domain/email_forwards/:email_forward

Delete the email forward from the domain.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:email_forward` | `integer` | The email forward id

### Example

Delete the email forward with ID `1` under the domain `example.com`, in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/domains/example.com/email_forwards/1

### Response

Responds with HTTP 204 on success.

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the email forward cannot be deleted.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.