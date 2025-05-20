---
title: Template Records API | DNSimple API v2
excerpt: This page documents the DNSimple Template Records API v2.
---

# Template Records API

* TOC
{:toc}


## Template Record attributes {#template-record-attributes}

Please refer to the definition of the `TemplateRecord` data type in [our OpenAPI documentation](/v2/openapi.yml/).


## List template records {#listTemplateRecords}

    GET /:account/templates/:template/records

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:template` | `integer` or `string` | The template id or short name

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort template records by ID
`name` | Sort template records by name (alphabetical order)
`content` | Sort template records by content (alphabetical order)
`type` | Sort template records by type (alphabetical order)

The default sorting policy is by ascending `id`.

### Example

List records for the template `alpha` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/templates/alpha/records

### Response

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/listTemplateRecords/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Create a template record {#createTemplateRecord}

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
<%= pretty_print_fixture("/api/createTemplateRecord/created.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the template record cannot be created.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.


## Get a template record {#getTemplateRecord}

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

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/getTemplateRecord/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Delete a template record {#deleteTemplateRecord}

    DELETE /:account/templates/:template/records/:record

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

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the template record cannot be deleted.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.
