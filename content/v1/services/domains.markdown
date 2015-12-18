---
title: Applied Services
excerpt: Welcome to DNSimple. This page is about applying services with our API. Enjoy low cost hosted DNS services and our REST API.
---

# Applied Service API

* TOC
{:toc}


## List applied services {#applied}

    GET /domains/:domain/applied_services

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

List applied services for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/example.com/applied_services

### Response

~~~json
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


## List available services {#available}

    GET /domains/:domain/available_services

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

List available services for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/example.com/available_services

### Response

~~~json
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


## Apply a service {#apply}

    POST /domains/:domain/applied_services

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

Apply a services to domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v1/domains/example.com/applied_services

### Input

Name | Type | Description
-----|------|------------
`service.id` | `integer` | **Required**. The id of the service to apply.
`settings` | `hash` | Optional hash of settings for some specific services, corresponding to the [service fields](https://github.com/aetrion/dnsimple-services#fields). For instance, [Heroku requires a `settings[app]` setting](https://github.com/aetrion/dnsimple-services/blob/master/services/heroku/config.json#L8-L14).

### Response

Responds with HTTP 200 on success, returns the list of services applied to the domain.

~~~json
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
  }
]
~~~


## Unapply a service {#unapply}

    DELETE /domains/:domain/applied_services/:id

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id
`:id` | `integer` | The service id

### Example

Unapply the services `123` from domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/domains/example.com/applied_services/123

### Response

Responds with HTTP 200 on success.
