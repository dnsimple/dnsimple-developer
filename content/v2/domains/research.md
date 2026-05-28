---
title: Domain Research API | Domains | DNSimple API v2
excerpt: This page documents the DNSimple domain research API v2.
---

# Domain Research API

<%= render "/v2-private-beta-feature.*" %>

### Table of Contents {#toc}

* TOC
{:toc}

## Domains research status {#getDomainsResearchStatus}

Research a domain name for availability and registration status information.

This endpoint provides information about a domain's availability status, including whether it's available for registration, already registered, or has other restrictions that prevent registration.

> [!NOTE]
> This endpoint is designed for high-volume domain availability lookups and requires dedicated paid access. [Contact sales](https://dnsimple.com/sales) to request access. If you only need to check a domain's state before issuing a registration or transfer, use the [Check domain](/v2/registrar/#checkDomain) endpoint instead, which is rate-limited and intended for low-volume use.

~~~
GET /:account/domains/research/status
~~~

### Access

Access is gated by the **Domain Research** subscription on the account.

Access tokens used with this endpoint must include the `domain_research_read` scope.

### Usage visibility

The account's month-to-date Domain Research request count is shown in the **API Limits & Usage** card on the API tokens page in the DNSimple app.

### Monthly request cap

This endpoint has a monthly request cap that depends on your subscription. Once an account reaches its cap, further requests in the same calendar month respond with [HTTP 429](#errors) and a `Retry-After` header indicating when the cap resets.

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

Responds with [HTTP 429](/v2/#too-many-requests) if the account has reached its [monthly request cap](#monthly-request-cap). The response includes a `Retry-After` header set to the time at which the cap resets.
