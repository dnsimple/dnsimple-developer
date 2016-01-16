---
title: Registrar | DNSimple API v2
excerpt: This page documents the DNSimple registry/registrar API v2.
---

# Registrar API

* TOC
{:toc}


## Register a domain {#register}

    POST /:account/registrar/:domain/registration

Register a domain name with DNSimple.

Your account must be active for this command to complete successfully.
You will be automatically charged the registration fee upon successful registration, so please be careful with this command.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name

### Example

Register the domain example.com in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/registrar/example.com/registration

### Input

Name | Type | Description
-----|------|------------
`registrant_id` | `integer` | **Required**. The ID of an existing contact in your account.
`extended_attributes` | `hash` | **Required** for TLDs that require [extended attributes](/extended-attributes/).

##### Example

~~~json
{
}
~~~

##### Example with extended attributes

~~~json
{
}
~~~

### Response

Responds with HTTP 201 on success, returns the domain.

~~~json
{
}
~~~

Responds with HTTP 400 if the validation fails.

