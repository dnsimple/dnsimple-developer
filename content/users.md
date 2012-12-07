---
title: Users
---

# User API

API for provisioning users.

{:toc}


## Create an user

Provision a new user account.

    POST /users

### Example

Provision a new user:

    curl  \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/users

### Input

user.email
: Required _string_

user.password
: Required _string_

user.password_confirmation
: Required _string_

~~~ js
{
  "user": {
    "email": "john.smith@example.com",
    "password": "x8ejfhfgjQ#A",
    "password_confirmation": "x8ejfhfgjQ#A" 
  }
}
~~~

### Response

Responds with HTTP 400 if the validation fails.

Responds with HTTP 201 on success.

~~~ js
{
  "user": {
    "authy_identifier": null,
    "authy_verified_at": null,
    "country_code": null,
    "created_at": "2012-09-30T15:46:39Z",
    "default_contact_id": null,
    "email": "john.smith@example.com",
    "failed_login_count": 0,
    "first_name": null,
    "id": 2,
    "last_name": null,
    "login_count": 1,
    "phone": null,
    "referral_token": "0f82b5484cd663",
    "single_access_token": "o4xuNjyjtIn9mw1d2WGM",
    "unsubscribed_at": null,
    "updated_at": "2012-09-30T15:46:39Z",
    "domain_count": 0,
    "domain_limit": 10
  }
}
~~~
