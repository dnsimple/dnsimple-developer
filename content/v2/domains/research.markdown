---
title: Domain Research API | Domains | DNSimple API v2
excerpt: This page documents the DNSimple domain research API v2.
---

# Domain Research API

<%= render "v2-private-beta-feature" %>

### Table of Contents {#toc}

* TOC
{:toc}

## Domains research status {#getDomainsResearchStatus}

Research a domain name for availability and registration status information.

This endpoint provides information about a domain's availability status, including whether it's available for registration, already registered, or has other restrictions that prevent registration.

~~~
GET /:account/domains/research/status
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account ID

### Query Parameters

Name | Type | Description
-----|------|------------
`domain` | `string` | **Required**. The domain name to research

### Example

Research the domain `example.com` using account `1010`:

~~~shell
curl -H 'Authorization: Bearer <token>' \
     -H 'Accept: application/json' \
     https://api.dnsimple.com/v2/1010/domains/research/status?domain=example.com
~~~

### Response

Responds with HTTP 200 on success, returns the domain research information.

~~~json
{
  "data": {
    "request_id": "f453dabc-a27e-4bf1-a93e-f263577ffaae",
    "domain": "example.com",
    "availability": "unavailable",
    "errors": []
  }
}
~~~

#### Response Attributes

Name | Type | Description
-----|------|------------
`request_id` | `string` | UUID identifier for this research request
`domain` | `string` | The domain name that was researched
`availability` | `string` | The availability status. Possible values: `available`, `unavailable`, `unknown`
`errors` | `array` | Array of error messages if the domain cannot be registered or researched. Usually provides information about why the availability could not be determined.

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the domain research request is invalid.

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.