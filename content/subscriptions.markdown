---
title: Subscriptions
---

# Subscription API

* TOC
{:toc}

API for creating and managing account subscriptions.


## Get the subscription  {#get}

View the current subscription details.

    GET /subscription

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/subscription

### Response

Responds with HTTP 402 if the current user has no subscription.

Responds with HTTP 200 on success.

~~~js
{
  "subscription": {
    "id": 80,
    "user_id": 19,
    "plan_name": "Gold",
    "state": "subscribed",
    "domain_limit": 50,
    "created_at": "2014-06-24T13:42:51.355Z",
    "updated_at": "2014-07-06T20:37:52.279Z"
  }
}
~~~


## Create the subscription {#create}

Create a subscription for the currently authenticated user.

    POST /subscription

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v1/subscription

### Input

Name | Type | Description
-----|------|------------
`subscription.plan` | `string` | **Required**.
`subscription.credit_card.number` | `string` | **Required**.
`subscription.credit_card.first_name` | `string` | **Required**.
`subscription.credit_card.last_name` | `string` | **Required**.
`subscription.credit_card.billing_address` | `string` | **Required**.
`subscription.credit_card.billing_zip` | `string` | **Required**.
`subscription.credit_card.month` | `string` | **Required**.
`subscription.credit_card.year` | `string` | **Required**.
`subscription.credit_card.cvv` | `string` | **Required**.

##### Example

~~~js
{
  "subscription": {
    "plan": "Silver",
    "credit_card": {
      "number": "1",
      "first_name": "John",
      "last_name": "Smith",
      "billing_address": "111 SW 1st Street",
      "billing_zip": "12345",
      "month": "02",
      "year": "2015",
      "cvv": "111"
    }
  }
}
~~~

### Response

Responds with HTTP 201 on success.

~~~js
{
  "subscription": {
    "id": 80,
    "user_id": 19,
    "plan_name": "Gold",
    "state": "subscribed",
    "domain_limit": 50,
    "created_at": "2014-06-24T13:42:51.355Z",
    "updated_at": "2014-07-06T20:37:52.279Z"
  }
}
~~~

Responds with HTTP 400 if the validation fails.
