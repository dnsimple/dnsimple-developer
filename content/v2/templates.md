---
title: Templates API | DNSimple API v2
excerpt: This page documents the DNSimple templates API v2.
---

# Templates API

* TOC
{:toc}


## Template attributes {#template-attributes}

Please refer to the definition of the `Template` data type in [our OpenAPI documentation](/v2/openapi.yml).


## List templates {#listTemplates}

    GET /:account/templates

List templates in the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort templates by ID
`name` | Sort templates by name (alphabetical order)
`sid` | Sort templates by string ID (alphabetical order)

The default sorting policy is by ascending `id`.

### Example

List all templates in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/templates

### Response

Responds with HTTP 200 on success.

```json
<%= pretty_print_fixture("/api/listTemplates/success.http") %>
```

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.


## Create a template {#createTemplate}

    POST /:account/templates

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

Create a template in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '{"name": "Alpha","sid": "alpha","description": "This is an Alpha template."}' \
          https://api.dnsimple.com/v2/1010/templates

### Input

Name | Type | Description
-----|------|------------
`name` | `string` | **Required**.
`sid` | `string` | **Required**.
`description` | `string` |

##### Example

```json
{
  "name": "Alpha",
  "sid": "alpha",
  "description": "This is an Alpha template."
}
```

### Response

Responds with HTTP 201 on success.

```json
<%= pretty_print_fixture("/api/createTemplate/created.http") %>
```

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the template cannot be created.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.


## Retrieve a template {#getTemplate}

    GET /:account/templates/:template

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:template` | `integer`, `string` | The template id or short name

### Example

Get the template with ID `1` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/template/1

Get the template with short name `example` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/template/example

### Response

Responds with HTTP 200 on success.

```json
<%= pretty_print_fixture("/api/getTemplate/success.http") %>
```

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Update a template {#updateTemplate}

    PATCH /:account/templates/:template

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:template` | `integer`, `string` | The template id or short name

### Example

Update the template with ID `1` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PATCH \
          -d '{"name":"Alpha"}' \
          https://api.dnsimple.com/v2/1010/templates/1

Update the template with short name `example` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PATCH \
          -d '{"name":"Alpha"}' \
          https://api.dnsimple.com/v2/1010/templates/example

### Input

See [create](#create).

### Response

Responds with HTTP 200 on success.

```json
<%= pretty_print_fixture("/api/updateTemplate/success.http") %>
```

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the template cannot be updated.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Delete a template {#deleteTemplate}

    DELETE /:account/templates/:template

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:template` | `integer`, `string` | The template id or short name

### Example

Delete the template with ID `1` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/templates/1

Delete the template with short name `example` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/templates/example

### Response

Responds with HTTP 204 on success.

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the template cannot be deleted.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.