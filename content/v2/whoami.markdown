---
title: Whoami | DNSimple API v2
excerpt: This page documents the DNSimple whoami API v2 endpoint.
---

# Whoami API

* TOC
{:toc}


## Whoami

    GET /whoami

Get details about the current authenticated entity used to access the API.

### Example

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/whoami

### Response

Responds with HTTP 200.

~~~json
{
  "user": {},
  "account": {}
}
~~~

Either user or account may be nil, depending on how you are authenticated.
