---
title: Domain Zones
---

# Domain Zone API

* TOC
{:toc}


## Import Domain Zone

    POST /domains/:domain/zone_imports

### Example

Import zone for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          /domains/example.com/zone_imports

### Input

zone_import.zone_data
: Required _string_

~~~ js
{
  "zone_import": {
    "zone_data": "$ORIGIN example.com.\n$TTL 1h\nexample.com. IN  SOA ns1.dnsimple.com admin.dnsimple.com 2011092001 86400 7200 604800 300\nexample.com. IN NS  ns1.dnsimple.com.\nexample.com. IN NS  ns2.dnsimple.com.\nexample.com. IN NS  ns3.dnsimple.com.\nexample.com. IN NS  ns4.dnsimple.com.\nds1.example.com. 3600 IN  A 184.106.215.134\nindex.example.com. 3600 IN  NS ds1.example.com\n; example.com. 3600 IN  URL http://dnsimple.com\n; www.example.com. 3600 IN  URL https://dnsimple.com"
  }
}
~~~

### Response

Responds with HTTP 200 on success.
Responds with HTTP 400 if the validation fails.

~~~ js
{
  "zone_import": {
    "imported_records": [
      {
        "record": {
          "content": "184.106.215.134",
          "created_at": "2012-10-02T16:39:49Z",
          "domain_id": 406,
          "id": 388,
          "name": "ds1",
          "prio": null,
          "record_type": "A",
          "ttl": 3600,
          "updated_at": "2012-10-02T16:39:49Z"
        }
      },
      {
        "record": {
          "content": "ds1.example.com.example.com",
          "created_at": "2012-10-02T16:39:49Z",
          "domain_id": 406,
          "id": 389,
          "name": "index",
          "prio": null,
          "record_type": "NS",
          "ttl": 3600,
          "updated_at": "2012-10-02T16:39:49Z"
        }
      }
    ],
    "imported_records_count": 2,
    "not_imported_records": [

    ],
    "not_imported_records_count": 0
  }
}
~~~
