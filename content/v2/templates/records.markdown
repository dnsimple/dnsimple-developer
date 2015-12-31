---
title: Template Records | DNSimple API v2
excerpt: This page documents the DNSimple Template Records API v2.
---

# Template Records API

* TOC
{:toc}


## List records for a template {#list}

    GET /:account/templates/:template/records

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:template` | `integer` or `string` | The template id or short name

### Example

List records for the template `example` in the account `1001`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1001/templates/example/records

### Response

Responds with HTTP 200.

~~~json
[
  {},
  {}
]
~~~


## Create a template record {#create}

    POST /:account/templates/:template/records

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:template` | `integer` or `string` | The template id or short name

### Example

Create a record for the template `example` in the account `1001`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1001/templates/example.com/records

### Input

Name | Type | Description
-----|------|------------
`record.name` | `string` | **Required**. Use an empty string to create a record for the apex.
`record.type` | `string` | **Required**.
`record.content` | `string` | **Required**.
`record.ttl` | `integer` |
`record.priority` | `integer` |

##### Example

~~~json
{}
~~~

### Response

Responds with HTTP 201 on success.

~~~json
{}
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Get a template record {#get}

    GET /:account/templates/:template/records/:record

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:template` | `integer` or `string` | The template id or short name
`:record` | `integer` | The record id

### Example

Get the record `2` for the template `example` in the account `1001`.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1001/templates/example/records/2

### Response

~~~json
{}
~~~


## Delete a template record {#delete}

    DELETE /:account/zone/:zone/records/:record

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:template` | `integer` or `string` | The template id or short name
`:record` | `integer` | The record id

### Example

Delete the record with ID `2` for template `example` in the account `1001`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1001/templates/example/records/2

### Response

Responds with HTTP 204 on success.

