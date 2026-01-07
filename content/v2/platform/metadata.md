---
title: Metadata API | DNSimple API v2
excerpt: This page documents the DNSimple Platform Metadata API.
---

# Metadata API

<%= render "v2-private-beta-platform" %>

* TOC
{:toc}

The Metadata API provides a key/value store that is attached to a specific resource (such as a domain, DNS record, etc) in a DNSimple account. A metadata value with a key that already exists will replace the previous value for that same key on a given resource.

## Metadata attributes

~~~json
{
  "id": 103,
  "owner_type": "OauthApplication",
  "owner_id": 1,
  "account_id": 1,
  "resource": "platform_connection:172",
  "key": "App Name",
  "value": "my-app",
  "created_at": "Wed, 29 Jun 2010 12:45:05.037840000 UTC +00:00",
  "updated_at": "Wed, 29 Jun 2010 12:45:05.037840000 UTC +00:00"
}
~~~

## List Metadata

List metadata entries in the account for the specified resource.

~~~
GET /:account/platform/metadata/:resource
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account ID
`:metadata` | `integer` | The metadata identifier

## Show Metadata

Show the metadata entry in the account for the specified resource.

~~~
GET /:account/platform/metadata/:resource/:metadata
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account ID
`:resource` | `integer` | The resource identifier
`:metadata` | `integer` | The metadata identifier

## Create Metadata

Create a metadata entry in the account for the specified resource.

~~~
POST /:account/platform/metadata/:resource
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:resource` | `integer` | The resource identifier

### Example

### Input

Name | Type | Description
-----|------|------------
`resource` | `string` | **Required**, such as `domain:123` or `record:123` or `platform_connection:123`
`key` | `string` | A key for the entry
`value` | `string` | A value for the entry

##### Example

~~~json
{
  "resource": "domain:123",
  "key": "App Name",
  "value": "flying-cheeto-kite-surf"
}
~~~

### Response

Responds with HTTP 201, renders the metadata entry.

Responds with HTTP 400 if the validation fails.

Responds with HTTP 404 if the resource doesn't exist.

## Destroy Metadata

Destroy a metadata entry in the account for the specified resource. **This cannot be undone.**

~~~
DELETE /:account/platform/metadata/:resource/:metadata
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:resource` | `integer` | The resource identifier
`:metadata` | `integer` | The metadata identifier

### Response

Responds with HTTP 204 on success.
