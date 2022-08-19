---
title: Statuses API | DNSimple API v2
excerpt: This page documents the DNSimple Platform Statuses API.
---

# Statuses API

* TOC
{:toc}

<note>
  The Statuses API is part of the Platform API and is currently in Private Beta. During the Private Beta period changes may occur at any time.
</note>

---

Statuses are used to indicate the latest known status of some resource in relation to an add-on. Statuses have a fixed set of states and are not time-specific. Statuses have a context value and a status with the same context for a given resource will replace a previous status with that context for that resource.

## Status attributes

## List Statuses

List statuses in the account.

~~~
GET /:account/platform/statuses
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account ID

## Show Status

Show a status in the account.

~~~
GET /:account/platform/statuses/:status
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account ID
`:status` | `integer` | The status identifier

## Create Status

Create a status in the account.

~~~
POST /:account/platform/statuses
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

### Input

Name | Type | Description
-----|------|------------
`resource` | `string` | **Required**, such as `domain:123` or `record:123` or `platform_connection:123`
`state` | `string` | The state represented in the status. Available states are: `ok`, `error`, `warning`, `unknown`
`context` | `string` | defaults to `default`
`url` | `string` | A URL to link the status to
`title` | `string` | A short title to display to the user
`message` | `string` | A longer message to display to the user

##### Example

~~~json
{
  "resource": "domain:123",
  "state": "ok",
  "context": "page-a",
  "url": "https://yourapp.com/some/path",
  "title": "System OK",
  "message": "All systems are reporting OK."
}
~~~

### Response

Responds with HTTP 201, renders the status.

## List Resource Status History

List statuses for a specific resource in chronological order.

~~~
GET /:account/platform/statuses/:resource/history
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account ID
`:resource` | `integer` | The resource identifier
