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

Responds with HTTP 200. Either user or account may be nil, depending on how you are authenticated.

**Example when authenticated with an Account access token**

~~~json
{
  "data": {
    "user": null,
    "account": {
      "id": 1,
      "email": "account@example.com",
      "created_at": "2014-05-19T14:20:32.263Z",
      "updated_at": "2015-04-01T10:07:47.559Z"
    }
  }
}
~~~

**Example when authenticated with an User access token**

~~~json
{
  "data": {
    "user": {
      "id": 1,
      "email": "user@example.com",
      "created_at": "2014-05-19T14:20:32.263Z",
      "updated_at": "2015-04-01T10:07:47.559Z"
    },
    "account": null
  }
}
~~~

