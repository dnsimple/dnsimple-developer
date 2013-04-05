---
title: Prices
---

# Prices API

* TOC
{:toc}


## List Prices

List all prices.

    GET /prices

### Example

    curl  -H 'Accept: application/json' \
          https://dnsimple.com/prices

### Response

~~~ js
[
  {
    "price": {
      "minimum_registration": 1,
        "registration_enabled": true,
        "registration_price": "14.00",
        "renewal_enabled": true,
        "renewal_price": "14.00",
        "tld": "com",
        "transfer_enabled": true,
        "transfer_price": "14.00"
    }
  },
  {
    "price": {
      "minimum_registration": 1,
      "registration_enabled": true,
      "registration_price": "14.00",
      "renewal_enabled": true,
      "renewal_price": "14.00",
      "tld": "net",
      "transfer_enabled": true,
      "transfer_price": "14.00"
    }
  },
  {
    "price": {
      "minimum_registration": 1,
      "registration_enabled": true,
      "registration_price": "14.00",
      "renewal_enabled": true,
      "renewal_price": "14.00",
      "tld": "org",
      "transfer_enabled": true,
      "transfer_price": "14.00"
    }
  }
]
~~~
