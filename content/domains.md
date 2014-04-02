---
title: Domains
---

# Domain API

* TOC
{:toc}


## List domains {#list}

List all domains.

    GET /domains

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains

### Response

Responds with HTTP 200.

~~~js
[
  {
    "domain": {
      "id": 228,
      "user_id": 19,
      "registrant_id": null,
      "name": "example.it",
      "unicode_name": "example.it",
      "token": "domain-token",
      "state": "hosted",
      "language": null,
      "lockable": true,
      "auto_renew": false,
      "whois_protected": false,
      "record_count": 5,
      "service_count": 0,
      "expires_on": null,
      "created_at": "2014-01-15T22:03:49Z",
      "updated_at": "2014-01-15T22:03:49Z"
    }
  },
  {
    "domain": {
      "id": 227,
      "user_id": 19,
      "registrant_id": 28,
      "name": "example.com",
      "unicode_name": "example.com",
      "token": "domain-token",
      "state": "registered",
      "language": null,
      "lockable": true,
      "auto_renew": true,
      "whois_protected": false,
      "record_count": 7,
      "service_count": 0,
      "expires_on": "2015-01-16",
      "created_at": "2014-01-15T22:01:55Z",
      "updated_at": "2014-01-16T22:56:22Z"
    }
  }
]
~~~


## Create a domain {#create}

    POST /domains

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v1/domains

### Input

| Name | Type | Description |
|------|------|-------------|
`domain.name` | `string` | **Required**.

##### Example

~~~js
{
  "domain": {
    "name": "example.com"
  }
}
~~~

### Response

Responds with HTTP 201 on success, returns the domain.

~~~js
{
  "domain": {
    "id": 227,
    "user_id": 19,
    "registrant_id": 28,
    "name": "example.com",
    "unicode_name": "example.com",
    "token": "domain-token",
    "state": "registered",
    "language": null,
    "lockable": true,
    "auto_renew": true,
    "whois_protected": false,
    "record_count": 7,
    "service_count": 0,
    "expires_on": "2015-01-16",
    "created_at": "2014-01-15T22:01:55Z",
    "updated_at": "2014-01-16T22:56:22Z"
  }
}
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Get a domain {#get}

    GET /domains/:domain

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

Get the domain with ID `1`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/1

Get the domain `example.com`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/example.com

### Response

Responds with HTTP 200, returns the domain.

~~~js
{
  "domain": {
    "id": 227,
    "user_id": 19,
    "registrant_id": 28,
    "name": "example.com",
    "unicode_name": "example.com",
    "token": "domain-token",
    "state": "registered",
    "language": null,
    "lockable": true,
    "auto_renew": true,
    "whois_protected": false,
    "record_count": 7,
    "service_count": 0,
    "expires_on": "2015-01-16",
    "created_at": "2014-01-15T22:01:55Z",
    "updated_at": "2014-01-16T22:56:22Z"
  }
}
~~~


## Delete a domain {#delete}

<warning>
  #### Planned Changes

  There are <a href="/planned-changes/#delete-domainsdomain" class="alert-link">planned changes</a> for this API method.
</warning>

Delete the given domain from your account.

    DELETE /domains/:domain

Please note that for domains which are registered with DNSimple
this will not delete the domain from the registry.

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

Delete the domain with ID `1`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/domains/1

Delete the domain `example.com`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/domains/example.com

### Response

Responds with HTTP 200 on success.

<div class="alert alert-warning">
  <strong>Warning!</strong> The method will return a blank response in the future, you should not depend on the response body. See <a href="/planned-changes/#delete-domainsdomainrecordsid" class="alert-link">planned changes</a>.
</div>


## Reset a domain token {#reset-token}

    POST /domains/:domain/token

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

Reset the token for the domain `example.com`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -X POST \
          -H 'Content-Type: application/json' \
          -d '{}' \
          https://api.dnsimple.com/v1/domains/example.com/token

### Input

Empty.

### Response

Responds with HTTP 200 on success, returns the domain.

~~~js
{
  "domain": {
    "id": 227,
    "user_id": 19,
    "registrant_id": 28,
    "name": "example.com",
    "unicode_name": "example.com",
    "token": "domain-token",
    "state": "registered",
    "language": null,
    "lockable": true,
    "auto_renew": true,
    "whois_protected": false,
    "record_count": 7,
    "service_count": 0,
    "expires_on": "2015-01-16",
    "created_at": "2014-01-15T22:01:55Z",
    "updated_at": "2014-01-16T22:56:22Z"
  }
}
~~~

Responds with HTTP 400 if bad request.


## Push a domain {#push}

Move a domain from the current DNSimple account to another.

    POST /domains/:domain/push

Once a domain is pushed you will no longer be able to access it through your account.
You will need to acces it using the new account's credentials.

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

Move the domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v1/domains/example.com/push

### Input

| Name | Type || Description |
|------|------||-------------|
`push.new_user_email` | `string` | **Required**. Email of the new account's email address.
`push.contact_id` | `integer` | **Required**. The new account's registrant ID.

##### Example

~~~js
{
  "push": {
    "new_user_email": "john@example.com",
    "contact_id": 100
  }
}
~~~

### Response

Responds with HTTP 200 on success, returns the domain.

~~~js
{
  "domain": {
    "id": 227,
    "user_id": 19,
    "registrant_id": 100,
    "name": "example.com",
    "unicode_name": "example.com",
    "token": "domain-token",
    "state": "registered",
    "language": null,
    "lockable": true,
    "auto_renew": true,
    "whois_protected": false,
    "record_count": 7,
    "service_count": 0,
    "expires_on": "2015-01-16",
    "created_at": "2014-01-15T22:01:55Z",
    "updated_at": "2014-01-16T22:56:22Z"
  }
}
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.
