---
title: Template Records
excerpt: Welcome to DNSimple. This page is about our template record API. Hosted DNS has never been this easy.
---

# Template Record API

* TOC
{:toc}


## List template records {#list}

    GET /templates/:template/records

### Parameters

Name | Type | Description
-----|------|------------
`:template` | `integer`,`string` | The template id or short-name

### Example

List records for template `1`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/templates/1/records

List records for template `foo`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/templates/foo/records

### Response

Responds with HTTP 200.

~~~js
[
  {
    "dns_template_record": {
      "id": 1,
      "dns_template_id": 11,
      "name": "ww1",
      "content": "127.0.0.1",
      "ttl": 3600,
      "prio": null,
      "record_type": "ALIAS",
      "created_at": "2014-12-15T17:26:11.648Z",
      "updated_at": "2014-12-15T17:26:11.648Z"
    }
  },
  {
    "dns_template_record": {
      "id": 2,
      "dns_template_id": 12,
      "name": "ww2",
      "content": "127.0.0.1",
      "ttl": 3600,
      "prio": null,
      "record_type": "ALIAS",
      "created_at": "2014-12-15T17:25:20.431Z",
      "updated_at": "2014-12-15T17:25:20.431Z"
    }
  }
]

~~~


## Create a template record {#create}

    POST /templates/:template/records

### Example

Create a record for template `1`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v1/templates/1/records

### Input

Name | Type | Description
-----|------|------------
`record.name` | `string` | **Required**. Use an empty string to create a record for the root domain.
`record.record_type` | `string` | **Required**.
`record.content` | `string` | **Required**.
`record.ttl` | `integer` |
`record.prio` | `integer` |

~~~js
{
  "dns_template_record": {
    "name": "",
    "record_type": "MX",
    "content": "mail.example.com",
    "ttl": 3600,
    "prio": 10
  }
}
~~~

### Response

Responds with HTTP 201 on success.

~~~js
{
  "dns_template_record": {
    "id": 1,
    "dns_template_id": 11,
    "name": "ww2",
    "content": "127.0.0.1",
    "ttl": 3600,
    "prio": null,
    "record_type": "ALIAS",
    "created_at": "2014-12-15T17:26:11.648Z",
    "updated_at": "2014-12-15T17:26:11.648Z"
  }
}
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Get a template record {#get}

    GET /templates/:template/records/:record

### Parameters

Name | Type | Description
-----|------|------------
`:template` | `integer`,`string` | The template id or short-name
`:record` | `integer` | The record id

### Example

Get the record `2` for template `1`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/templates/1/records/2

### Response

~~~js
{
  "dns_template_record": {
    "id": 1,
    "dns_template_id": 11,
    "name": "ww1",
    "content": "127.0.0.1",
    "ttl": 3600,
    "prio": null,
    "record_type": "ALIAS",
    "created_at": "2014-12-15T17:26:11.648Z",
    "updated_at": "2014-12-15T17:26:11.648Z"
  }
}
~~~


## Update a template record {#update}

    PUT /templates/:domain/records/:record

### Parameters

Name | Type | Description
-----|------|------------
`:template` | `integer`,`string` | The template id or short-name
`:record` | `integer` | The record id

### Example

Update the record with ID `2` for template `1`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT \
          -d '<json>' \
          https://api.dnsimple.com/v1/templates/1/records/2

### Input

The following fields are updateable. You can pass zero of any of them.

Name | Type | Description
-----|------|------------
`record.name` | `string` | **Required**.
`record.content` | `string` | **Required**.
`record.ttl` | `integer` |
`record.prio` | `integer` |

##### Example

~~~js
{
  "record": {
    "content": "updated.example.com",
    "ttl": 600
  }
}
~~~

### Response

Responds with HTTP 200 on success.

~~~js
{
  "dns_template_record": {
    "id": 1,
    "dns_template_id": 11,
    "name": "ww1",
    "content": "127.0.0.1",
    "ttl": 3600,
    "prio": null,
    "record_type": "ALIAS",
    "created_at": "2014-12-15T17:26:11.648Z",
    "updated_at": "2014-12-15T17:26:11.648Z"
  }
}
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Delete a template record {#delete}

    DELETE /templates/:template/records/:record

### Parameters

Name | Type | Description
-----|------|------------
`:template` | `integer`,`string` | The template id or short-name
`:record` | `integer` | The record id

### Example

Delete the record with ID `2` for template `1`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/templates/1/records/2

### Response

Responds with HTTP 200 on success.

<div class="alert alert-warning">
  <strong>Warning!</strong> The method will return a blank response in the future, you should not depend on the response body. See <a href="/planned-changes/" class="alert-link">planned changes</a>.
</div>
