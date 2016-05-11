---
title: Zone Records API | DNSimple API v2 (Beta)
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
`:account` | `integer` | The account id or wildcard (`_`)
`:zone` | `string` | The zone name

### Example

List records for the zone `example.com`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/_/zones/example.com/records

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/listZoneRecords/success.http") %>
~~~

### Filters

Name | Description
-----|------------
`:name_like` | Only include records containing given string
`:name` | Only include records with name equal to given string
`:record_type` | Only include records with record type equal to given string

### Example

List records for the zone `example.com` with TXT zone records:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/_/zones/example.com/records?record_type=TXT

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort records by ID
`name` | Sort records by name (alphabetical order)
`content` | Sort records by content
`type` | Sort records by type
`created_at` | Sort records by creation timestamp
`updated_at` | Sort records by last update timestamp

The default sorting policy is by ascending `id`.

### Example

List records for the zone `example.com` sorting them by name (asc) and type (desc):

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/_/zones/example.com/records?sorting=name:asc,type:desc

## Create a zone record {#create}

    POST /:account/zones/:zone/records

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
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

~~~json
{
  "name": "",
  "type": "MX",
  "content": "mxa.example.com",
  "ttl": 600,
  "priority": 10
}
~~~

### Response

Responds with HTTP 201 on success.

~~~json
<%= pretty_print_fixture("/createZoneRecord/created.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Get a zone record {#get}

    GET /:account/zones/:zone/records/:record

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:zone` | `string` | The zone name
`:record` | `integer` | The record id

### Example

Get the record `64784` for the zone `example.com`.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/_/zones/example.com/records/64784

### Response

~~~json
<%= pretty_print_fixture("/getZoneRecord/success.http") %>
~~~


## Update a zone record {#update}

    PATCH /:account/zones/:zone/records/:record

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:zone` | `string` | The zone name
`:record` | `integer` | The record id

### Example

Update the record with ID `64784` for zone `example.com`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PATCH \
          -d '<json>' \
          https://api.dnsimple.com/v2/_/zones/example.com/records/64784

### Input

The following fields are updateable. You can pass zero of any of them.

Name | Type | Description
-----|------|------------
`record.name` | `string` |
`record.content` | `string` |
`record.ttl` | `integer` |
`record.priority` | `integer` |

##### Example

~~~json
{
  "content": "mxb.example.com",
  "ttl": 3600,
  "priority": 20
}
~~~

### Response

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/updateZoneRecord/success.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Delete a zone record {#delete}

    DELETE /:account/zones/:zone/records/:record

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:zone` | `string` | The zone name
`:record` | `integer` | The record id

### Example

Delete the record with ID `64784` for zone `example.com`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/_/zones/example.com/records/64784

### Response

Responds with HTTP 204 on success.
