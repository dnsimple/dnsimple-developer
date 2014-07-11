---
title: Templates
---

# Template API

Templates provide a way to group common records together and apply them en masse to a domain.

* TOC
{:toc}


## List templates {#list}

    GET /templates

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/templates

### Response

Responds with HTTP 200.

~~~js
[
  {
    "dns_template": {
      "name": "Example",
      "created_at": "2010-09-30T20:01:55Z",
      "updated_at": "2010-09-30T20:01:55Z",
      "id": 31,
      "user_id": 1,
      "short_name": "example",
      "description": "An example of a template."
    }
  }
]
~~~


## Get a template {#get}

    GET /templates/:template

### Parameters

Name | Type | Description
-----|------|------------
`:template` | `string`, `integer` | The template short-name or id

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

~~~js
{
  "dns_template": {
    "name": "Example",
    "created_at": "2010-09-30T20:01:55Z",
    "updated_at": "2010-09-30T20:01:55Z",
    "id": 31,
    "user_id": 1,
    "short_name": "example",
    "description": "An example of a template."
  }
}
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

| Name | Type | Description |
|------|------|-------------|
`dns_template.name` | `string` | **Required**.
`dns_template.short_name` | `string` | **Required**.
`dns_template.description` | `string` |

##### Example

~~~js
{
  "dns_template": {
    "name": "My Template",
    "short_name": "my_template"
  }
}
~~~

### Response

~~~js
TODO
~~~


## Delete a template {#delete}

    DELETE /templates/:id

### Parameters

Name | Type | Description
-----|------|------------
`:template` | `string`, `integer` | The template short-name or id

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

~~~js
TODO
~~~
