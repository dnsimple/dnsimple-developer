---
title: Domains API | DNSimple API v2 (Beta)
excerpt: This page documents the DNSimple domains API v2.
---

# Domains API

* TOC
{:toc}


## List domains {#list}

    GET /:account/domains

List domains for the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

List all domains for the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/listDomains/success.http") %>
~~~

### Filters

Name | Description
-----|------------
`:name_like` | Only include domains containing given string
`:registrant_id` | Only include domains containing given registrant ID

### Example

List all domains for the account 1010 that have name matching "example":

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains?name_like=example

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort domains by ID
`name` | Sort domains by name (alphabetical order)
`expires_on` | Sort domains by expiration date
`created_at` | Sort domains by creation timestamp
`updated_at` | Sort domains by last update timestamp

The default sorting policy is by ascending `name`.

## Create a domain {#create}

    POST /:account/domains

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

Create a domain in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/domains

### Input

Name | Type | Description
-----|------|------------
`name` | `string` | **Required**.

##### Example

~~~json
{
  "name": "example.com"
}
~~~

### Response

Responds with HTTP 201 on success, renders the domain.

~~~json
<%= pretty_print_fixture("/createDomain/created.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Get a domain {#get}

    GET /:account/domains/:domain

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:domain` | `string`, `integer` | The domain name or id

### Example

Get the domain with ID `1` in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/1

Get the domain `example.com` in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com

Get the domain with ID `1` with implicit account.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/_/domains/1

### Response

Responds with HTTP 200, renders the domain.

~~~json
<%= pretty_print_fixture("/getDomain/success.http") %>
~~~


## Delete a domain {#delete}

    DELETE /:account/domains/:domain

Delete the domain from the account.

For domains which are registered with DNSimple, this *will not delete the domain from the registry* or perform a refund.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:domain` | `string`, `integer` | The domain name or id

### Example

Delete the domain with ID `1 from the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/domains/1

Delete the domain `example.com` from the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/domains/example.com

### Response

Responds with HTTP 204 on success.


## Reset a domain token {#reset-token}

    POST /:account/domains/:domain/token

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:domain` | `string`, `integer` | The domain name or id

### Example

Reset the token for the domain `example.com` in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '{}' \
          https://api.dnsimple.com/v2/1010/domains/example.com/token

### Input

Empty.

### Response

Responds with HTTP 201 on success.

~~~json
<%= pretty_print_fixture("/resetDomainToken/success.http") %>
~~~

Responds with HTTP 400 if bad request.
