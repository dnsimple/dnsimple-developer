---
title: Services | DNSimple API v2
excerpt: This page documents the DNSimple services API v2.
---

# Services API

* TOC
{:toc}


## List services {#list}

    GET /services

### Example

List all services.

    curl -H 'Authorization: Bearer <token>' \
         -H 'Accept: application/json' \
         https://api.dnsimple.com/v2/services

### Response

~~~json
[
  {
    "service": {
      "id": 1,
      "name": "Google Apps",
      "short_name": "googleapps",
      "description": "Add Google Apps for your domain.",
      "created_at": "2015-11-23T11:40:05Z",
      "updated_at": "2015-11-23T11:40:05Z",
    }
  },
  {
    "service": {
      "id": 2,
      "name": "Heroku",
      "short_name": "heroku",
      "description": "Use Heroku as your web host.",
      "created_at": "2015-11-23T11:40:05Z",
      "updated_at": "2015-11-23T11:40:05Z",
    }
  }
]
~~~


## Get a service {#get}

    GET /services/:service

### Parameters

Name | Type | Description
-----|------|------------
`:service` | `string`, `integer` | The service name or id

### Example

Get the service with ID `1`.

    curl -H 'Authorization: Bearer <token>' \
         -H 'Accept: application/json' \
         https://api.dnsimple.com/v2/services/1

### Response

~~~json
{
  "service": {
    "id": 1,
    "name": "Google Apps",
    "short_name": "googleapps",
    "description": "Add Google Apps for your domain.",
    "created_at": "2015-11-23T11:40:05Z",
    "updated_at": "2015-11-23T11:40:05Z",
  }
}
~~~
