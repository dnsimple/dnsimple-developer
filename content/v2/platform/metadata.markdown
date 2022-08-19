---
title: Metadata API | DNSimple API v2
excerpt: This page documents the DNSimple Platform Metadata API.
---

# Metadata API

* TOC
{:toc}

<note>
  The Metadata API is part of the Platform API and is currently in Private Beta. During the Private Beta period changes may occur at any time.
</note>

---

The Metadata API provides a key/value store that is attached to a specific resource (such as a domain, DNS record, etc) in a DNSimple account. A metadata value with a key that already exists will replace the previous value for that same key on a given resource.

## Metadata attributes

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
