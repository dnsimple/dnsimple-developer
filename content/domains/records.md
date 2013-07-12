---
title: Domain Records
---

# Domain Record API

* TOC
{:toc}


## List domain records

    GET /domains/:domain/records

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/:domain/records

### Parameters

name
: _String_ name to search. Example: `www`

type
: _String_ record type. Example: `CNAME`

### Response

~~~ js
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


## Get a domain record

    GET /domains/:domain/records/:id

### Example

Get the record `123` for domain `example.com`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/example.com/records/123

### Response

~~~ js
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


## Create a domain record

    POST /domains/:domain/records

### Example

Create a record for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/domains/example.com/records

### Input

record.name
: Required _string_

record.record_type
: Required _string_

record.content
: Required _string_

record.ttl
: Optional _integer_

record.prio
: Optional _integer_

~~~ js
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

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.

Responds with HTTP 201 on success.

~~~ js
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


## Update a domain record

    PUT /domains/:domain/records/:id

### Example

Update the record with ID `123` for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT
          -d '<json>' \
          https://dnsimple.com/domains/example.com/records/123

### Input

The following fields are updateable.

record.name
: Required _string_

record.content
: Required _string_

record.ttl
: Optional _integer_

record.prio
: Optional _integer_

~~~ js
{
  "record": {
    "content": "updated.example.com",
    "ttl": 600
  }
}
~~~

### Response

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.

Responds with HTTP 200 on success.

~~~ js
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


## Delete a domain record

<div class="alert">
  <strong>Warning!</strong> There are <a href="/planned-changes/#delete-domainsdomainrecordsid">planned changes</a> for this API method.
</div>

    DELETE /domains/:domain/records/:id

### Example

Delete the record with ID `123` for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/example.com/records/123

### Response

Responds with HTTP 200 on success.

<div class="alert">
  <strong>Warning!</strong> The method will return a blank response in the future, you should not depend on the response body. See <a href="/planned-changes/#delete-domainsdomainrecordsid">planned changes</a>.
</div>
