---
title: Services
excerpt: This page documents the DNSimple Services API v2.
---

# Service API

* TOC
{:toc}

Services provide a way to apply many records to a domain at once.
Additionally any changes made to a service will automatically be reflected in the domain's records.


## List services {#list}

    GET /services

### Example

List all services.

    curl -H 'Authorization: Bearer <token>' \
         -H 'Accept: application/json' \
         https://api.dnsimple.com/v2/services

### Response

~~~js
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
`:service` | `integer` | The service id

### Example

Get the service with ID `1`.

    curl -H 'Authorization: Bearer <token>' \
         -H 'Accept: application/json' \
         https://api.dnsimple.com/v2/services/1

### Response

~~~js
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

Responds with HTTP 404 if not found.
