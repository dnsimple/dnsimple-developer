---
title: Services API | DNSimple API v2
excerpt: This page documents the DNSimple services API v2.
---

# Services API

* TOC
{:toc}


## Service attributes {#service-attributes}

Please refer to the definition of the `Service` data type in [our OpenAPI documentation](/v2/openapi.yml).


## Service Setting attributes {#service-setting-attributes}

Please refer to the definition of the `ServiceSetting` data type in [our OpenAPI documentation](/v2/openapi.yml).


## List services {#listServices}

    GET /services

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort services by ID
`sid` | Sort services by string ID (alphabetical order)

The default sorting policy is by ascending `id`.

### Example

List all services.

    curl -H 'Authorization: Bearer <token>' \
         -H 'Accept: application/json' \
         https://api.dnsimple.com/v2/services

### Response

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/listServices/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Retrieve a service {#getService}

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

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/getService/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.