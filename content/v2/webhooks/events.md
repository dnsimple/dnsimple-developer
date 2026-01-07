---
title: Webhooks and Events | DNSimple API v2
excerpt: This page documents the OAuth 2 flow you can use to access the DNSimple API.
---

# Webhooks and Events

* TOC
{:toc}

---

## Overview

Webhooks are used for receiving notifications via an HTTP request whenever an event occurs in your DNSimple account.

You can register your webhook URLs either through the DNSimple web interface or through the DNSimple API, using the [Webhook API endpoints](/v2/webhooks/).

All webhooks are sent via HTTPS using POST. It MAY occur that some webhook fire more than once. Clients MUST handle webhooks with the same `request_identifier` to not process them twice.

## Webhooks

### Webhook Payload

Webhook data is sent as a JSON object in a POST request to URLs you define. All webhook messages have the same basic structure, which is called the payload:

```json
{
  "name": "object.action",
  "api_version": "v2",
  "request_identifier": "fca1f30a-4219-4278-9272-c00e5cc2eb5c",
  "data": {},
  "account": {},
  "actor": {}
}
```

The `name` attribute contains a string representing the name of event that occurred. It will always have an `object` and `action` separated by a period. It may optionally include a state for objects that go through state changes, for example `domain.registration:started`.

The `api_version` is the API version used to serialize the data in the payload. For version 2 of the API, this is the string `v2`. For example, you can expect a domain object to be serialized using the same [domain attributes](/v2/domains/#domain-attributes) described in the corresponding API page.

The `request_identifier` attribute is a UUID that provides a way to identify this request. You may use this UUID to ensure a webhook is processed once and only once by keeping a persistent history of the identifiers sent and never handling a webhook which was already processed.

The `data` attribute contains any data for the object or objects related to the **Event** (see below). Each object in the `data` object will be keyed on an object type name. For example:

```json
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

The `account` is an object describing which account the event occurred in. It is a lightweight representation of the account and includes the `id`, a unique `identifier` and a `display` text representation.

The `actor` is an object describing the entity that triggered the event. This may be a user if the event was triggered due to activity via the UI or API, or it may be a system entity if the activity occurred as part of an asynchronous process. The actor object has three attributes: `id`, which is a unique identifier for the actor, `entity` which describes what type the actor is, and `pretty`, which is a printable representation of the actor for use in display.

### Responding to Webhooks

To confirm receipt of a webhook, your server must respond with an HTTP 200 response. Any other response will be considered an error and will cause the delivery to be re-tried.

## Events

### Event List

For the list of available events, refer to the definition of the `WebhookPayload` schema in [our OpenAPI documentation](/v2/openapi.yml).


### Event payloads

We maintain a [repository of example payloads](https://github.com/dnsimple/dnsimple-developer/tree/master/fixtures/v2/webhooks) that you can use to design and test your integrations.

## Delivery attempts and retries {#deliveryAttemptsAndRetries}

Understand the retry logic when webhook events are not acknowledged.

### Retry logic

Across all environments, DNSimple attempts to deliver an event to your webhooks for up to 2 hours with exponential backoff. The delivery mechanism allows for up to 10 attempts within the allotted time.

If your webhook endpoint has been disabled, no further retry attempts are made for that webhook endpoint. However, if the endpoint is re-enabled before the next retry attempt, DNSimple will continue to process the event delivery via the normal retry flow.

### Suppression logic

If your webhook endpoint has been misconfigured and has not responded with a 200 HTTP status code consistently for up to 15 attempts, DNSimple will automatically suppress the webhook endpoint.

> [!NOTE]
> You can view the health of your webhook and remove suppressions from your account page.
> Please see the [support page on webhooks](https://support.dnsimple.com/articles/webhooks/#clearing-suppression) for more information.
