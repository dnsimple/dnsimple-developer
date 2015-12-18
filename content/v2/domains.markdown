---
title: Domains | DNSimple API v2
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
[
  {},
  {}
]
~~~


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
{}
~~~

### Response

Responds with HTTP 201 on success, renders the domain.

~~~json
{}
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

Get the domain with ID `1`.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/_/domains/1

Get the domain `example.com`.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/_/domains/example.com

### Response

Responds with HTTP 200, renders the domain.

~~~json
{}
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

Delete the domain with ID `1`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/_/domains/1

Delete the domain `example.com`.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/_/domains/example.com

### Response

Responds with HTTP 204 on success.


## Reset a domain token {#reset-token}

    POST /domains/:domain/token

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:domain` | `string`, `integer` | The domain name or id

### Example

Reset the token for the domain `example.com`.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '{}' \
          https://api.dnsimple.com/v2/_/domains/example.com/token

### Input

Empty.

### Response

Responds with HTTP 201 on success.

~~~json
{}
~~~

Responds with HTTP 400 if bad request.
