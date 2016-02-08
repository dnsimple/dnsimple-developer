---
title: Webhooks | DNSimple API v2
excerpt: This page documents the DNSimple webhooks API v2.
---

# Webhooks API

* TOC
{:toc}


## Overview

Webhooks are used for receiving notifications via an HTTPS POST whenever an event occurs in your DNSimple account.

You may register your webhook URLs either through the DNSimple web interface or through the DNSimple API. Note: Webhooks are only supported in the DNSimple API v2 and higher.

### Webhook Payload

Webhook data is sent as a JSON object in a POST request to URLs you define. All webhook messages have the same basic structure, which is called the payload:

```json
{
  "action": "object.event",
  "api_version": "v2",
  "request_identifier", "fca1f30a-4219-4278-9272-c00e5cc2eb5c",
  "data": {},
  "actor": {}
}
```

The `action` attribute contains a string representing the event that occurred. It will always have an `object` and `event` separated by a period. It may also include a state for objects that go through state changes. For example: `domain.registration:started`.

The `api_version` is the API version used to serialize the data in the payload. For version 2 of the API, this is the string `v2`.

The `request_identifier` attribute is a UUID that provides a way to identify this request. You may use this UUID to ensure a webhook is processed once and only once by keeping a persistent history of the identifiers sent and never handling a webhook which was already processed.

The `data` attribute contains any data for the object or objects related to the event. Each object in the `data` object will be keyed on an object type name. For example:

```
{
  ...
  "data": {
    "domain": {
      "name": "example.com",
      ...
    }
  }
}
```

The `actor` is an object describing the entity that triggered the event. This may be a user if the event was triggered due to activity via the UI or API, or it may be a system entity if the activity occurred as part of an asynchronous process.

### Responding to Webhooks

To confirm receipt of a webhook, your server must respond with an HTTP 200 response. Any other response will be considered an error and may cause the event to be retried.

## List webhooks {#list}

    GET /:account/webhooks

List webhooks for the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

List all webhooks for the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/webhooks

### Response

Responds with HTTP 200.

~~~json
[
  {},
  {}
]
~~~


## Create a webhook {#create}

    POST /:account/webhooks

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

Create a webhook in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/webhooks

### Input

Name | Type | Description
-----|------|------------
`url` | `string` | **Required**.

##### Example

~~~json
{}
~~~

### Response

Responds with HTTP 201 on success.

~~~json
{}
~~~

Responds with HTTP 400 if the validation fails.


## Get a webhook {#get}

    GET /:account/webhooks/:webhook

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:webhook` | `integer`, `string` | The webhook id

### Example

Get the webhook with ID `1` in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/webhook/1


### Response

~~~json
{}
~~~


## Delete a webhook {#delete}

    DELETE /:account/webhooks/:webhook

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:webhook` | `integer`, `string` | The webhook id

### Example

Delete the webhook with ID `1` in the account 1010:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/webhooks/1

### Response

Responds with HTTP 204 on success.

