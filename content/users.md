---
title: Users
---

# User API

API for provisioning users.


## Create an user

Provision a new user account.

    POST /users

If the user can be created then this method will respond with 201.
If the user already exists or is invalid then this will return response code 422.

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -d <json> \
          https://dnsimple.com/users

### Input

<pre class="highlight"><code class="language-js">
{
  "user": {
    "email": "john.smith@example.com",
    "password": "x8ejfhfgjQ#A",
    "password_confirmation": "x8ejfhfgjQ#A" 
  }
}
</code></pre>

### Response

<pre class="highlight"><code class="language-js">
TODO
</code></pre>
