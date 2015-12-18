---
title: Prices
excerpt: This page documents the DNSimple prices API v1.
---

# Prices API

* TOC
{:toc}


## List prices {#list}

    GET /prices

### Example

    curl  -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/prices

### Response

~~~json
[
  {
    "price": {
      "tld": "com",
      "minimum_registration": 1,
      "registration_price": "14.00",
      "registration_enabled": true,
      "transfer_price": "14.00",
      "transfer_enabled": true,
      "renewal_price": "14.00",
      "renewal_enabled": true
    }
  },
  {
    "price": {
      "tld": "net",
      "minimum_registration": 1,
      "registration_price": "14.00",
      "registration_enabled": true,
      "transfer_price": "14.00",
      "transfer_enabled": true,
      "renewal_price": "14.00",
      "renewal_enabled": true
    }
  }
]
~~~
