---
title: Template Records API | DNSimple API v2 (Beta)
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

List records for the template `alpha` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/templates/alpha/records

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/listTemplateRecords/success.http") %>
~~~

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort template records by ID
`name` | Sort template records by name (alphabetical order)
`content` | Sort template records by content (alphabetical order)
`type` | Sort template records by type (alphabetical order)
`expires_on` | Sort template records by expiration date

The default sorting policy is by ascending `id`.


## Create a template record {#create}

    POST /:account/templates/:template/records

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:template` | `integer` or `string` | The template id or short name

### Example

Create a record for the template `alpha` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/templates/alpha/records

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
  "content": "mx.example.com",
  "ttl": 600,
  "priority": 10
}
~~~

### Response

Responds with HTTP 201 on success.

~~~json
<%= pretty_print_fixture("/createTemplateRecord/created.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Get a template record {#get}

    GET /:account/templates/:template/records/:record

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:template` | `integer` or `string` | The template id or short name
`:record` | `integer` | The record id

### Example

Get the record `301` for the template `alpha` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/templates/alpha/records/301

### Response

~~~json
<%= pretty_print_fixture("/getTemplateRecord/success.http") %>
~~~


## Delete a template record {#delete}

    DELETE /:account/zone/:zone/records/:record

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:template` | `integer` or `string` | The template id or short name
`:record` | `integer` | The record id

### Example

Delete the record with ID `301` for template `alpha` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/templates/alpha/records/301

### Response

Responds with HTTP 204 on success.

