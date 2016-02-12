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
~~~
