---
title: Templates
---

# Template API

Templates provide a way to group common records together and apply them en masse to a domain.

* TOC
{:toc}


## List templates

    GET /templates

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/templates

### Response

~~~ js
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


## Get a template

    GET /templates/:id

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/templates/:id

### Response

~~~ js
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


## Create a template

    POST /templates

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v1/templates

### Input

The following fields are required:

- `dns_template[name]`
- `dns_template[short_name]`

The following fields are optional:

- `dns_template[description]`

~~~ js
{
  "dns_template": {
    "name": "My Template",
    "short_name": "my_template" 
  }
}
~~~

### Response

~~~ js
TODO
~~~


## Delete a template

    DELETE /templates/:id

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/templates/:id

### Response

~~~ js
TODO
~~~
