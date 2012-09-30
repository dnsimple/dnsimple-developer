---
title: Users
---

# User API

API for provisioning users.

{:toc}


## Create an user

Provision a new user account.

    POST /users

If the user can be created then this method will respond with 201.
If the user already exists or is invalid then this will return response code 422.

### Example

Provision a new user:

    curl  \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/users

### Input

user[:email]
: Required _string_

user[:password]
: Required _string_

user[:password_confirmation]
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

~~~ js
TODO
~~~
