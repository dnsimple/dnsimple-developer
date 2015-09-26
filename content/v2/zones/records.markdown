---
title: Zone Records
excerpt: This page documents the DNSimple records API v2.
---

# Zone Record API

* TOC
{:toc}


## List records for a zone {#list}

    GET /:account/zones/:zone/records

### Parameters

Name | Type | Description
-----|------|------------
`:zone` | `string` | The zone name

### Example

List records for the zone `example.com`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/_/zones/example.com/records

### Response

Responds with HTTP 200.

~~~js
[
  {},
  {}
]
~~~


## Create a zone record {#create}

    POST /:account/zones/:zone/records

### Parameters

Name | Type | Description
-----|------|------------
`:zone` | `string` | The zone name

### Example

Create a record for the zone `example.com`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/_/zones/example.com/records

### Input

Name | Type | Description
-----|------|------------
`record.name` | `string` | **Required**. Use an empty string to create a record for the apex.
`record.type` | `string` | **Required**.
`record.content` | `string` | **Required**.
`record.ttl` | `integer` |
`record.priority` | `integer` |

##### Example

~~~js
{}
~~~

### Response

Responds with HTTP 201 on success.

~~~js
{}
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Get a zone record {#get}

    GET /:account/zones/:zone/records/:record

### Parameters

Name | Type | Description
-----|------|------------
`:zone` | `string` | The zone name
`:record` | `integer` | The record id

### Example

Get the record `2` for the zone `example.com`.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/_/zones/example.com/records/2

### Response

~~~js
{}
~~~


## Update a zone record {#update}

    PATCH /:account/zones/:zone/records/:record

### Parameters

Name | Type | Description
-----|------|------------
`:zone` | `string` | The zone name
`:record` | `integer` | The record id

### Example

Update the record with ID `2` for zone `example.com`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PATCH \
          -d '<json>' \
          https://api.dnsimple.com/v2/_/zones/example.com/records/2

### Input

The following fields are updateable. You can pass zero of any of them.

Name | Type | Description
-----|------|------------
`record.name` | `string` |
`record.content` | `string` |
`record.ttl` | `integer` |
`record.priority` | `integer` |

##### Example

~~~js
{}
~~~

### Response

Responds with HTTP 200 on success.

~~~js
{}
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Delete a zone record {#delete}

    DELETE /:account/zone/:zone/records/:record

### Parameters

Name | Type | Description
-----|------|------------
`:zone` | `string` | The zone name
`:record` | `integer` | The record id

### Example

Delete the record with ID `2` for zone `example.com`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/_/zones/example.com/records/2

### Response

Responds with HTTP 204 on success.