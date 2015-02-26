---
title: Services
excerpt: Welcome to DNSimple. This page is about our API for Services. Hosted DNS has never been this easy.
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

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/services

### Response

~~~js
[
  {
    "service": {
      "created_at": "2010-12-15T08:08:02Z",
      "description": "Add Google Apps for your domain.",
      "id": 1,
      "name": "Google Apps",
      "short_name": "googleapps",
      "updated_at": "2010-12-15T08:08:02Z" 
    } 
  },
  {
    "service": {
      "created_at": "2010-12-15T08:08:02Z",
      "description": "Use Heroku as your web host.",
      "id": 2,
      "name": "Heroku",
      "short_name": "heroku",
      "updated_at": "2010-12-15T08:08:02Z" 
    } 
  }
]
~~~


## Get a service {#get}

    GET /services/:id

### Parameters

Name | Type | Description
-----|------|------------
`:id` | `integer` | The service id

### Example

Get the service with ID `123`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/services/123

### Response

~~~js
{
  "service": {
    "created_at": "2010-12-15T08:08:02Z",
    "description": "Add Google Apps for your domain.",
    "id": 1,
    "name": "Google Apps",
    "short_name": "googleapps",
    "updated_at": "2010-12-15T08:08:02Z"
  }
}
~~~
