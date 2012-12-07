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
          https://dnsimple.com/domains/example.com/zone_imports

Import zone for domain with ID `123`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/domains/123/zone_imports

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

Responds with HTTP 400 if the validation fails.

Responds with HTTP 201 on success.

~~~ js
{
  "zone_import": {
    "imported_records": [
      {
        "content": "184.106.215.134",
        "created_at": "2012-10-03T09:28:58Z",
        "domain_id": 414,
        "id": 400,
        "name": "ds1",
        "prio": null,
        "record_type": "A",
        "ttl": 3600,
        "updated_at": "2012-10-03T09:28:58Z"
      },
      {
        "content": "ds1.example.com.example.com",
        "created_at": "2012-10-03T09:28:58Z",
        "domain_id": 414,
        "id": 401,
        "name": "index",
        "prio": null,
        "record_type": "NS",
        "ttl": 3600,
        "updated_at": "2012-10-03T09:28:58Z"
      }
    ],
    "imported_records_count": 2,
    "not_imported_records": [
      {
        "content": "184.106.214.600",
        "created_at": null,
        "domain_id": 414,
        "id": null,
        "name": "ds2",
        "prio": null,
        "record_type": "A",
        "ttl": 3600,
        "updated_at": null,
        "errors": "Content IP address is invalid"
      }
    ],
    "not_imported_records_count": 1
  }
}
~~~

## Export Domain Zone

    GET /domains/:domain/zone.txt

### Example

Export zone for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          https://dnsimple.com/domains/example.com/zone.txt

Export zone for domain with ID `123`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          https://dnsimple.com/domains/123/zone.txt

### Response

~~~
$ORIGIN example.com.
$TTL 1h
example.com. IN SOA ns1.dnsimple.com admin.dnsimple.com 2012112401 86400 7200 604800 300
example.com. IN NS  ns1.dnsimple.com.
example.com. IN NS  ns2.dnsimple.com.
example.com. IN NS  ns3.dnsimple.com.
example.com. IN NS  ns4.dnsimple.com.
~~~
