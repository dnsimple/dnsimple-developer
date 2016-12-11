---
title: Templates API | DNSimple API v2 (Beta)
excerpt: This page documents the DNSimple templates API v2.
---

# Templates API

* TOC
{:toc}


## List templates {#list}

    GET /:account/templates

List templates in the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

List all templates in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/templates

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/listTemplates/success.http") %>
~~~

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort templates by ID
`name` | Sort templates by name (alphabetical order)
`short_name` | Sort templates by short name (alphabetical order)

The default sorting policy is by ascending `id`.


## Create a template {#create}

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
          -d '{"name": "Alpha","short_name": "alpha","description": "This is an Alpha template."}' \
          https://api.dnsimple.com/v2/1010/templates

### Input

Name | Type | Description
-----|------|------------
`name` | `string` | **Required**.
`short_name` | `string` | **Required**.
`description` | `string` | **Required**.

##### Example

~~~json
{
  "name": "Alpha",
  "short_name": "alpha",
  "description": "This is an Alpha template."
}
~~~

### Response

Responds with HTTP 201 on success.

~~~json
<%= pretty_print_fixture("/createTemplate/created.http") %>
~~~

Responds with HTTP 400 if the validation fails.


## Get a template {#get}

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

~~~json
<%= pretty_print_fixture("/getTemplate/success.http") %>
~~~


## Update a template {#update}

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

~~~json
<%= pretty_print_fixture("/updateTemplate/success.http") %>
~~~

Responds with HTTP 400 if the validation fails.


## Delete a template {#delete}

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
