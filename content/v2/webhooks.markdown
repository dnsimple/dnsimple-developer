---
title: Webhooks | DNSimple API v2
excerpt: This page documents the DNSimple webhooks API v2.
---

# Webhooks API

* TOC
{:toc}


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

