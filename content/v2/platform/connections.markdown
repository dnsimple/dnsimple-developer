---
title: Connections API | DNSimple API v2
excerpt: This page documents the DNSimple Platform Connections API.
---

# Connections API

<%= render "v2-private-beta-platform" %>

* TOC
{:toc}

## Connection attributes

~~~json
{
  "id": 172,
  "account_id": 1,
  "addon_id": 1,
  "resource": "domain:123",
  "created_at": "Wed, 29 Jun 2010 12:45:03.217725000 UTC +00:00",
  "updated_at": "Wed, 29 Jun 2010 12:45:03.217725000 UTC +00:00",
  "title": "Connection to MyApp"
}
~~~

## Create Connection

Create a connection in the account.

~~~
POST /:account/platform/connections
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

### Input

Name | Type | Description
-----|------|------------
`resource` | `string` | **Required** The resource identifier this connection applies to, such as `domain:123` or `record:123`
`title` | `string` | A title for the connection to display to users

##### Example

~~~json
{
  "resource": "domain:123",
  "title": "Connection to MyApp"
}
~~~

### Response

Responds with HTTP 201, renders the connection.

Responds with HTTP 400 if the validation fails.

Responds with HTTP 404 if the resource doesn't exist.

## Destroy Connection

Destroy a connection in the account.

~~~
DELETE /:account/platform/connections/:connection
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:connection` | `integer` | The connection identifier

### Response

Responds with HTTP 204 on success.

Responds with HTTP 400 if the validation fails.

Responds with HTTP 404 if the resource doesn't exist.
