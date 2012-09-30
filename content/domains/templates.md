---
title: Templates
---

# Template API

* TOC
{:toc}


## Apply a template

Apply the specific template to the domain.

    POST /domains/:domain/templates/:id/apply

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -X POST \
          https://dnsimple.com/domains/:domain/templates/:id/apply

### Response

~~~ js
TODO
~~~
