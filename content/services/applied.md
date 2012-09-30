---
title: Applied Services
---

# Applied Service API

* TOC
{:toc}


## List applied services

    GET /domains/:domain/applied_services

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/:domain/applied_services

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


## List available services

    GET /domains/:domain/available_services

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/:domain/available_services

### Response

~~~ js
[
  {
    "service": {
      "created_at": "2010-12-15T08:08:02Z",
      "description": "Forward {{domain}} to your Wordpress.com hosted blog.",
      "id": 3,
      "name": "WordPress",
      "short_name": "wordpress",
      "updated_at": "2010-12-15T08:08:02Z"
    }
  },
  {
    "service": {
      "created_at": "2010-12-15T08:08:02Z",
      "description": "Use posterious.com as your blog.",
      "id": 4,
      "name": "Posterous",
      "short_name": "posterous",
      "updated_at": "2010-12-15T08:08:02Z"
    }
  },
  {
    "service": {
      "created_at": "2010-12-15T08:08:02Z",
      "description": "Use Blogger for your blog.",
      "id": 5,
      "name": "Blogger",
      "short_name": "blogger",
      "updated_at": "2010-12-15T08:08:02Z"
    }
  },
  {
    "service": {
      "created_at": "2010-12-15T08:08:02Z",
      "description": "Use Tumblr for your blog.",
      "id": 6,
      "name": "Tumblr",
      "short_name": "tumblr",
      "updated_at": "2010-12-15T08:08:02Z"
    }
  },
  {
    "service": {
      "created_at": "2010-12-15T08:08:02Z",
      "description": "Use Tender for your customer support.",
      "id": 7,
      "name": "Tender",
      "short_name": "tender",
      "updated_at": "2010-12-15T08:08:02Z"
    }
  }
]
~~~


## Apply a service

    POST /domains/:domain/applied_services

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/domains/:domain/applied_services

### Input

The following fields are required:

- `service[id]`

### Response

~~~ js
TODO
~~~


## Unapply a service

    DELETE /domains/:domain/applied_services/:id

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/:domain/applied_services/:id

### Response

~~~ js
TODO
~~~
