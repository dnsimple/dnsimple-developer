---
title: Webhooks API | DNSimple API v2
excerpt: This page documents the DNSimple webhooks API v2.
---

# Webhooks API

* TOC
{:toc}


Webhooks are used for receiving notifications via an HTTP request whenever an event occurs in your DNSimple account. For more information visit the [Webhook and Events](/v2/webhooks/events/) section.

You can register a webhook URLs using the API endpints below to subscribe to account events. The URL must use HTTPS and the webhook handler should be able to receive HTTP POST requests.

## List webhooks {#listWebhooks}

    GET /:account/webhooks

List webhooks in the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort webhooks by ID

The default sorting policy is by ascending `id`.

### Example

List all webhooks in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/webhooks

### Response

Responds with HTTP 200 on success.

```json
<%= pretty_print_fixture("/api/listWebhooks/success.http") %>
```

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.


## Create a webhook {#createWebhook}

    POST /:account/webhooks

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

Create a webhook in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '{"url":"https://test.host/handler"}' \
          https://api.dnsimple.com/v2/1010/webhooks

### Input

Name | Type | Description
-----|------|------------
`url` | `string` | **Required**.

##### Example

```json
{
  "url": "https://test.host/handler"
}
```

### Response

Responds with HTTP 201 on success.

```json
<%= pretty_print_fixture("/api/createWebhook/created.http") %>
```

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the webhook cannot be created.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.


## Retrieve a webhook {#getWebhook}

    GET /:account/webhooks/:webhook

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:webhook` | `integer`, `string` | The webhook id

### Example

Get the webhook with ID `1` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/webhooks/1


### Response

Responds with HTTP 200 on success.

```json
<%= pretty_print_fixture("/api/getWebhook/success.http") %>
```

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Delete a webhook {#deleteWebhook}

    DELETE /:account/webhooks/:webhook

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:webhook` | `integer`, `string` | The webhook id

### Example

Delete the webhook with ID `1` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/webhooks/1

### Response

Responds with HTTP 204 on success.

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the webhook cannot be deleted.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.