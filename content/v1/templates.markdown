---
title: Templates
excerpt: This page documents the DNSimple Templates API v1.
---

# Template API

* TOC
{:toc}

Templates provide a way to group common records together and apply them en masse to a domain.


## List templates {#list}

    GET /templates

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/templates

### Response

Responds with HTTP 200.

~~~json
[
  {
    "dns_template": {
      "id": 1,
      "user_id": 11,
      "name": "Example",
      "description": "An example of a template.",
      "short_name": "example",
      "created_at": "2010-09-30T20:01:55Z",
      "updated_at": "2010-09-30T20:01:55Z"
    }
  },
  {
    "dns_template": {
      "id": 2,
      "user_id": 12,
      "name": "Example",
      "description": "An example of a template.",
      "short_name": "example-2",
      "created_at": "2010-09-30T20:01:55Z",
      "updated_at": "2010-09-30T20:01:55Z"
    }
  }
]
~~~


## Create a template {#create}

    POST /templates

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v1/templates

### Input

Name | Type | Description
-----|------|------------
`dns_template.name` | `string` | **Required**.
`dns_template.short_name` | `string` | **Required**.
`dns_template.description` | `string` |

##### Example

~~~json
{
  "dns_template": {
    "name": "My Template",
    "short_name": "my_template"
  }
}
~~~

### Response

Responds with HTTP 201 on success.

~~~json
{
  "dns_template": {
    "id": 1,
    "user_id": 11,
    "name": "Example",
    "description": "An example of a template.",
    "short_name": "example",
    "created_at": "2010-09-30T20:01:55Z",
    "updated_at": "2010-09-30T20:01:55Z"
  }
}
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Get a template {#get}

    GET /templates/:template

### Parameters

Name | Type | Description
-----|------|------------
`:template` | `integer`,`string` | The template id or short-name

### Example

Get the template with ID `1`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/templates/1

Get the template with short-name `heroku`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/templates/heroku

### Response

~~~json
{
  "dns_template": {
    "id": 1,
    "user_id": 11,
    "name": "Example",
    "description": "An example of a template.",
    "short_name": "example",
    "created_at": "2010-09-30T20:01:55Z",
    "updated_at": "2010-09-30T20:01:55Z"
  }
}
~~~


## Update a template {#update}

    PUT /templates/:id

### Parameters

Name | Type | Description
-----|------|------------
`:template` | `integer`,`string` | The template id or short-name

### Example

Update the template with ID `1`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT \
          -d '<json>' \
          https://api.dnsimple.com/v1/templates/1

### Input

See [create](#create).

### Response

Responds with HTTP 200 on success.

~~~json
{
  "dns_template": {
    "id": 1,
    "user_id": 11,
    "name": "Example",
    "description": "An example of a template.",
    "short_name": "example",
    "created_at": "2010-09-30T20:01:55Z",
    "updated_at": "2010-09-30T20:01:55Z"
  }
}
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Delete a template {#delete}

    DELETE /templates/:id

### Parameters

Name | Type | Description
-----|------|------------
`:template` | `integer`,`string` | The template id or short-name

### Example

Get the template with ID `1`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/templates/1

Get the template with short-name `heroku`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/templates/heroku

### Response

Responds with HTTP 200 on success.

<div class="alert alert-warning">
  <strong>Warning!</strong> The method will return a blank response in the future, you should not depend on the response body. See <a href="/planned-changes/" class="alert-link">planned changes</a>.
</div>
