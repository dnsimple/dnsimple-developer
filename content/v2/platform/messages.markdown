---
title: Messages API | DNSimple API v2
excerpt: This page documents the DNSimple Platform Messages API.
---

# Messages API

* TOC
{:toc}

<note>
  The Messages API is part of the Platform API and is currently in Private Beta. During the Private Beta period changes may occur at any time.
</note>

---

Messages contain information that add-ons want displayed to users of a DNSimple account for a particular resource, such as a domain or DNS record. Messages can be updated and deleted and can be set to expire after a period of time.

## Message attributes

## List Messages

List messages in the account.

~~~
GET /:account/platform/messages
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account ID

## Show Message

Show a message in the account.

~~~
GET /:account/platform/messages/:message
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account ID
`:message` | `integer` | The message identifier

## Create Message

Create a message in the account.

~~~
POST /:account/platform/messages
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
`url` | `string` | A URL to link the status to
`title` | `string` | A short title to display to the user
`message` | `string` | A longer message to display to the user
`expires_at` | `datetime` | A datetime indicating when the message expires and will no longer be displayed

##### Example

~~~json
{
  "resource": "domain:123",
  "url": "https://yourapp.com/some/path",
  "title": "Domain configured",
  "message": "Your domain is now configured for MyApp",
  "expires\_at": "2022-01-18 18:40:52 UTC" 
}
~~~

### Response

Responds with HTTP 201, renders the message.

## Update Message

Update a message in the account.

~~~
POST /:account/platform/messages
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:message` | `integer` | The message identifier

### Example

### Input

Name | Type | Description
-----|------|------------
`resource` | `string` | **Required**, such as `domain:123` or `record:123`
`url` | `string` | A URL to link the status to
`title` | `string` | A short title to display to the user
`message` | `string` | A longer message to display to the user
`expires_at` | `datetime` | A datetime indicating when the message expires and will no longer be displayed

##### Example

~~~json
{
  "resource": "domain:123",
  "url": "https://yourapp.com/some/path",
  "title": "Domain updated",
  "message": "Your domain is now updated",
  "expires\_at": "2022-01-19 18:40:52 UTC" 
}
~~~

### Response

Responds with HTTP 200, renders the message.


## Destroy Message

Destroy a message in the account. **This cannot be undone.**

~~~
DELETE /:account/platform/messages/:message
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:message` | `integer` | The message identifier

### Response

Responds with HTTP 204 on success.
