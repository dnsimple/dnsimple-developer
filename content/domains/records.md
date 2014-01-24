---
title: Domain Records
---

# Domain Record API

* TOC
{:toc}


## List records for a domain

    GET /domains/:domain/records

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/:domain/records

### Parameters

| Name | Type | Description |
| -----|------|-------------|
`:domain` | `string`, `integer` | The domain name or id
`name` | `string` | The name to search for. Example: `www`
`type` | `string` | The record type to search for. Example: `www`

### Response

~~~js
[
  {
    "record": {
      "name": "",
      "ttl": 3600,
      "created_at": "2010-07-04T04:41:31Z",
      "updated_at": "2010-10-21T15:47:47Z",
      "domain_id": 1,
      "id": 31,
      "content": "1.2.3.4",
      "record_type": "A",
      "prio": null
    }
  },
  {
    "record": {
      "name": "www",
      "ttl": 3600,
      "created_at": "2010-07-01T08:01:18Z",
      "updated_at": "2010-10-21T15:47:47Z",
      "domain_id": 1,
      "id": 2,
      "content": "example.com",
      "record_type": "CNAME",
      "prio": null
    }
  },
  {
    "record": {
      "name": "",
      "ttl": 3600,
      "created_at": "2010-07-04T04:42:11Z",
      "updated_at": "2010-10-21T15:47:47Z",
      "pdns_identifier": "40",
      "domain_id": 1,
      "id": 32,
      "content": "mail.example.com",
      "record_type": "MX",
      "prio": 10
    }
  }
]
~~~


## Create a record

    POST /domains/:domain/records

### Parameters

| Name | Type | Description |
| -----|------|-------------|
`:domain` | `string`, `integer` | The domain name or id

### Example

Create a record for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v1/domains/example.com/records

### Input

| Name | Type | Description |
|------|------|-------------|
`record.name` | `string` | **Required**. Use an empty string to create a record for the root domain.
`record.record_type` | `string` | **Required**.
`record.content` | `string` | **Required**.
`record.ttl` | `integer` |
`record.prio` | `integer` |

##### Example

~~~js
{
  "record": {
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
  "record": {
    "content": "mail.example.com",
    "created_at": "2013-01-29T14:25:38Z",
    "domain_id": 28,
    "id": 172,
    "name": "",
    "prio": 10,
    "record_type": "MX",
    "ttl": 3600,
    "updated_at": "2013-01-29T14:25:38Z"
  }
}
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Get a record

    GET /domains/:domain/records/:id

### Parameters

| Name | Type | Description |
| -----|------|-------------|
`:domain` | `string`, `integer` | The domain name or id
`:id` | `integer` | The record id

### Example

Get the record `123` for domain `example.com`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/example.com/records/123

### Response

~~~js
{
  "record": {
    "name": "www",
    "ttl": 3600,
    "created_at": "2010-07-01T08:01:18Z",
    "updated_at": "2010-10-21T15:47:47Z",
    "domain_id": 1,
    "id": 123,
    "content": "example.com",
    "record_type": "CNAME",
    "prio": null
  }
}
~~~


## Update a record

    PUT /domains/:domain/records/:id

### Parameters

| Name | Type | Description |
| -----|------|-------------|
`:domain` | `string`, `integer` | The domain name or id
`:id` | `integer` | The record id

### Example

Update the record with ID `123` for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT
          -d '<json>' \
          https://api.dnsimple.com/v1/domains/example.com/records/123

### Input

The following fields are updateable. You can pass zero of any of them.

| Name | Type | Description |
|------|------|-------------|
`record.name` | `string` | **Required**. Use an empty string to create a record for the root domain.
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
  "record": {
    "content": "updated.example.com",
    "created_at": "2013-01-29T14:25:38Z",
    "domain_id": 28,
    "id": 123,
    "name": "",
    "prio": 10,
    "record_type": "MX",
    "ttl": 600,
    "updated_at": "2013-01-29T14:25:38Z"
  }
}
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Delete a record

<div class="alert alert-warning">
  <strong>Warning!</strong> There are <a href="/planned-changes/#delete-domainsdomainrecordsid" class="alert-link">planned changes</a> for this API method.
</div>

    DELETE /domains/:domain/records/:id

### Parameters

| Name | Type | Description |
| -----|------|-------------|
`:domain` | `string`, `integer` | The domain name or id
`:id` | `integer` | The record id

### Example

Delete the record with ID `123` for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/domains/example.com/records/123

### Response

Responds with HTTP 200 on success.

<div class="alert alert-warning">
  <strong>Warning!</strong> The method will return a blank response in the future, you should not depend on the response body. See <a href="/planned-changes/#delete-domainsdomainrecordsid" class="alert-link">planned changes</a>.
</div>
