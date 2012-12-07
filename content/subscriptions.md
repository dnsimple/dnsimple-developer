---
title: Subscriptions
---

# Subscription API

API for creating and managing account subscriptions.

{:toc}


## Get the subscription 

View the current subscription details.

    GET /subscription

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/subscription

### Response

Responds with HTTP 402 if the current user has no subscription.

Responds with HTTP 200 on success.

~~~ js
{
  "chargify_subscription": {
    "allocated_quantity": 0,
    "created_at": "2012-05-09T15:35:57Z",
    "domain_limit": 10,
    "failure_reason": null,
    "id": 3817,
    "plan_name": "Silver",
    "state": "subscribed",
    "statements_refreshed_at": "2012-09-26T10:55:21Z",
    "updated_at": "2012-09-26T10:55:21Z",
    "user_id": 4321
  }
}
~~~


## Create the subscription

Create a subscription for the currently authenticated user.

    POST /subscription

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/subscription

### Input

subscription.plan
: Required _string_

subscription.credit_card.number
: Required _string_

subscription.credit_card.first_name
: Required _string_

subscription.credit_card.last_name
: Required _string_

subscription.credit_card.billing_address
: Required _string_

subscription.credit_card.billing_zip
: Required _string_

subscription.credit_card.month
: Required _string_

subscription.credit_card.year
: Required _string_

subscription.credit_card.cvv
: Required _string_

~~~ js
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

Responds with HTTP 400 if the validation fails.

Responds with HTTP 201 on success.

~~~ js
{
  "chargify_subscription": {
    "allocated_quantity": 0,
    "created_at": "2012-09-30T17:40:42Z",
    "domain_limit": 50,
    "failure_reason": null,
    "id": 2,
    "plan_name": "Unknown",
    "state": "subscribing",
    "statements_refreshed_at": null,
    "updated_at": "2012-09-30T17:40:42Z",
    "user_id": null
  }
}
~~~
