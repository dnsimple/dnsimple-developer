---
title: Applied Templates
---

# Applied Template API

* TOC
{:toc}


## Apply a template

Apply the specific template to the domain.

    POST /domains/:domain/templates/:id/apply

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://api.dnsimple.com/v1/domains/:domain/templates/:id/apply

### Response

~~~js
TODO
~~~
