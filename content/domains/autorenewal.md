---
title: Domain Auto-renewal
---

# Domain Auto-renewal API

* TOC
{:toc}


## Enable domain auto-renewal

    POST /domains/:domain/auto_renewal

Some TLDs do not support auto-renewal and will respond with an error condition in that case.

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://dnsimple.com/domains/:domain/auto_renewal

### Response

~~~ js
TODO
~~~


## Disable domain auto-renewal

    DELETE /domains/:domain/auto_renewal

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/:domain/auto_renewal

### Response

~~~ js
TODO
~~~
