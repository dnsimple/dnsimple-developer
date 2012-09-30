---
title: Domain Records
---

# Domain Record API

* TOC
{:toc}


## List domain records

    GET /domain/:domain/records

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domain/:domain/records

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
      "special_type": null,
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
      "special_type": null,
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
      "special_type": null,
      "updated_at": "2010-10-21T15:47:47Z",
      "pdns_identifier": "40",
      "domain_id": 1,
      "id": 32,
      "content": "mail.somesite.com",
      "record_type": "MX",
      "prio": 10
    }
  }
]
~~~


## Get a domain record

    GET /domains/:domain/records/:id

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/:domain/records/:id

### Response

~~~ js
{
  "record": {
    "name": "www",
    "ttl": 3600,
    "created_at": "2010-07-01T08:01:18Z",
    "special_type": null,
    "updated_at": "2010-10-21T15:47:47Z",
    "domain_id": 1,
    "id": 2,
    "content": "example.com",
    "record_type": "CNAME",
    "prio": null
  }
}
~~~


## Create a domain record

    POST /domains/:domain/records

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/domains/:domain/records

### Input

The following fields are required:

- `record[name]`
- `record[record_type]`
- `record[content]`

The following fields are optional:

- `record[ttl]`
- `record[prio]`

~~~ js
{
  "record": {
    "name": "",
    "record_type": "MX",
    "content": "mail1.mailservers.com",
    "ttl": 3600,
    "prio": 10
  }
}
~~~

### Response

~~~ js
TODO
~~~


## Update a domain record

    PUT /domains/:domain/records/:id

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT
          -d '<json>' \
          https://dnsimple.com/domains/:domain/records/:id

### Input

The following fields are updateable:

- `record[name]`
- `record[content]`
- `record[ttl]`
- `record[prio]`

~~~ js
{
  "record": {
    "name": "",
    "content": "1.2.3.4",
    "ttl": 600
  }
}
~~~

### Response

~~~ js
TODO
~~~


## Delete a domain record

    DELETE /domains/:domain/records/:id

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/:domain/records/:id

### Response

~~~ js
TODO
~~~
