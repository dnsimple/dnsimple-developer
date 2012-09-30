---
title: Template Records
---

# Template Record API

* TOC
{:toc}


## List template records

    GET /templates/:template/records

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          https://dnsimple.com/templates/:template/records

### Response

~~~ js
[
  {
    "dns_template_record": {
      "name": "",
      "ttl": 3600,
      "dns_template_id": 31,
      "created_at": "2010-09-30T20:02:11Z",
      "special_type": "",
      "updated_at": "2010-09-30T20:02:11Z",
      "id": 119,
      "content": "1.2.3.4",
      "record_type": "A",
      "prio": null
    }
  },
  {
    "dns_template_record": {
      "name": "www",
      "ttl": 3600,
      "dns_template_id": 31,
      "created_at": "2010-09-30T20:02:11Z",
      "special_type": "",
      "updated_at": "2010-09-30T20:02:11Z",
      "id": 120,
      "content": "example.com",
      "record_type": "CNAME",
      "prio": null
    }
  }
]
~~~


## Get a template record

    GET /templates/:template/records/:id

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          https://dnsimple.com/templates/:template/records/:id

### Response

~~~ js
{
  "dns_template_record": {
    "name": "",
    "ttl": 3600,
    "dns_template_id": 31,
    "created_at": "2010-09-30T20:02:11Z",
    "special_type": "",
    "updated_at": "2010-09-30T20:02:11Z",
    "id": 119,
    "content": "1.2.3.4",
    "record_type": "A",
    "prio": null
  }
}
~~~


## Create a template record

    POST /templates/:template/records

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -d <json> \
          https://dnsimple.com/templates/:template/records

### Input

The following fields are required:

- `dns_template_record[name]`
- `dns_template_record[record_type]`
- `dns_template_record[content]`

The following fields are optional:

– `dns_template_record[ttl]`
– `dns_template_record[prio]`

~~~ js
{
  "dns_template_record": {
    "name": "sample",
    "record_type": "A",
    "content": "1.2.3.4",
    "ttl": 7200
  }
}
~~~

### Response

~~~ js
TODO
~~~


## Delete a template record

    DELETE /templates/:template/records/:id

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -X DELETE \
          https://dnsimple.com/templates/:template/records/:id

### Response

~~~ js
TODO
~~~
