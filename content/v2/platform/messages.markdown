---
title: Messages API | DNSimple API v2
excerpt: This page documents the DNSimple Platform Messages API.
---

* TOC
{:toc}

<note>
  The Messages API is part of the Platform API and is currently in Private Beta. During the Private Beta period changes may occur at any time.
</note>

---

Messages contain information that add-ons want displayed to users of a DNSimple account for a particular resource, such as a domain or DNS record. Messages can be updated and deleted and can be set to expire after a period of time.

## Message attributes {#message-attributes}

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
`resource` | `string` | **Required** TBD
`url` | `string` | A URL to link the status to
`title` | `string` | A short title to display to the user
`message` | `string` | A longer message to display to the user
`expires_at` | `datetime` | A datetime indicating when the message expires and will no longer be displayed

##### Example

~~~json
{
  "resource": "",
  "url": "https://yourapp.com/some/path",
  "title": "",
  "message": "",
  "expires\_at": "" 
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
`resource` | `string` | **Required** TBD
`url` | `string` | A URL to link the status to
`title` | `string` | A short title to display to the user
`message` | `string` | A longer message to display to the user
`expires_at` | `datetime` | A datetime indicating when the message expires and will no longer be displayed

##### Example

~~~json
{
  "resource": "",
  "url": "https://yourapp.com/some/path",
  "title": "",
  "message": "",
  "expires\_at": "" 
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
