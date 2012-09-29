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

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          https://dnsimple.com/subscription

### Response

~~~ js
{
  "chargify_subscription": {
    "allocated_quantity": 0,
    "created_at": "2012-05-09T15:35:57Z",
    "customer_id": 1234,
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

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -d <json> \
          https://dnsimple.com/subscription

### Input

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

~~~ js
TODO
~~~
