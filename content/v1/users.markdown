---
title: Users
excerpt: This page documents the DNSimple Users API v1.
---

# User API

* TOC
{:toc}

API for provisioning users.


## Create an user {#create}

Provision a new user account.

    POST /users

### Example

Provision a new user:

    curl  \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v1/users

### Input

Name | Type | Description
-----|------|------------
`user.email` | `string` | **Required**.
`user.password` | `string` | **Required**.
`user.password_confirmation` | `string` | **Required**.

~~~json
{
  "user": {
    "email": "john.smith@example.com",
    "password": "x8ejfhfgjQ#A",
    "password_confirmation": "x8ejfhfgjQ#A"
  }
}
~~~

### Response

Responds with HTTP 201 on success.

~~~json
{
  "user": {
    "id": 1,
    "email": "example@example.com",
    "referral_token": "ad932ffb60c295",
    "single_access_token": "api-token",
    "default_contact_id": null,
    "domain_count": 2,
    "domain_limit": 500,
    "login_count": 3,
    "failed_login_count": 0,
    "unsubscribed_at": null,
    "created_at": "2014-01-15T21:59:04Z",
    "updated_at": "2014-01-15T23:21:50Z",
  }
}
~~~

Responds with HTTP 400 if the validation fails.
