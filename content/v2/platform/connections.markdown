---
title: Connections API | DNSimple API v2
excerpt: This page documents the DNSimple Platform Connections API.
---

# Connections API

* TOC
{:toc}

<note>
  The Connections API is part of the Platform API and is currently in Private Beta. During the Private Beta period changes may occur at any time.
</note>

## Connection attributes

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
