---
title: Services API | DNSimple API v2 (Beta)
excerpt: This page documents the DNSimple services API v2.
---

# Services API

* TOC
{:toc}

## Service Attributes #{service-attributes}

Name | Description
-----|------------
`id` | A unique identifier
`name` | A human-readable name
`short_name` | A name that can be used in URLs (always lowercase)
`description` | A human-readable description of the one-click service
`setup_description` | Describes setup requirements (optional)
`requires_setup` | Flag indicating whether setup is required
`default_subdomain` | The default subdomain used when creating DNS records
`created_at` | When the service was first added to DNSimple
`updated_at` | When the service was last changed in DNSimple
`settings` | A list of objects describing each setting that requires configuration

### Settings #{service-attributes-settings}

Name | Description
-----|------------
`name` | The form name for the setting
`label` | The human-readable label value
`append` | Additional text to append to the input field
`description` | Description of the setting
`example` | An example value
`password` | Set to true if the value is a password (and thus should be not visible in the field)

## List services {#list}

    GET /services

### Example

List all services.

    curl -H 'Authorization: Bearer <token>' \
         -H 'Accept: application/json' \
         https://api.dnsimple.com/v2/services

### Response

~~~json
<%= pretty_print_fixture("/listServices/success.http") %>
~~~

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort services by ID
`short_name` | Sort services by short name (alphabetical order)

The default sorting policy is by ascending `id`.


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
<%= pretty_print_fixture("/getService/success.http") %>
~~~
