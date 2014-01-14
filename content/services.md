---
title: Services
---

# Service API

Services provide a way to apply many records to a domain at once.
Additionally any changes made to a service will automatically be reflected in the domain's records.

* TOC
{:toc}


## List services

    GET /services

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/services

### Response

~~~ js
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


## Get a service

    GET /services/:id

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/services/:id

### Response

~~~ js
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
