---
title: Templates | DNSimple API v2
excerpt: This page documents the DNSimple templates API v2.
---

# Templates API

* TOC
{:toc}


## List templates {#list}

    GET /:account/templates

List templates for the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

List all templates for the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/templates

### Response

Responds with HTTP 200.

~~~json
[
  {},
  {}
]
~~~


## Create a template {#create}

    POST /:account/templates

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

Create a template in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/templates

### Input

Name | Type | Description
-----|------|------------
`name` | `string` | **Required**.
`short_name` | `string` | **Required**.
`description` | `string` | **Required**.

##### Example

~~~json
{}
~~~

### Response

Responds with HTTP 201 on success.

~~~json
{}
~~~

Responds with HTTP 400 if the validation fails.


## Get a template {#get}

    GET /:account/templates/:template

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:template` | `integer`, `string` | The template id or short name

### Example

Get the template with ID `1`.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/_/template/1

Get the template with short name `example`.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/_/template/example

### Response

~~~json
{}
~~~


## Update a template {#update}

    PATCH /:account/templates/:template

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:template` | `integer`, `string` | The template id or short name

### Example

Update the template with ID `1`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PATCH \
          -d '<json>' \
          https://api.dnsimple.com/v2/_/templates/1

Update the template with short name `example`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PATCH \
          -d '<json>' \
          https://api.dnsimple.com/v2/_/templates/example

### Input

See [create](#create).

### Response

Responds with HTTP 200 on success.

~~~json
{}
~~~

Responds with HTTP 400 if the validation fails.


## Delete a template {#delete}

    DELETE /:account/templates/:template

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:template` | `integer`, `string` | The template id or short name

### Example

Delete the template with ID `1`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/_/templates/1

Delete the template with short name `example`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/_/templates/example

### Response

Responds with HTTP 204 on success.
