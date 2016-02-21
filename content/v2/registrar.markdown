---
title: Registrar | DNSimple API v2
excerpt: This page documents the DNSimple registry/registrar API v2.
---

# Registrar API

* TOC
{:toc}


## Register a domain {#register}

    POST /:account/registrar/domains/:domain/registration

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
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/registration

### Input

Name | Type | Description
-----|------|------------
`registrant_id` | `integer` | **Required**. The ID of an existing contact in your account.
`extended_attributes` | `hash` | **Required** for TLDs that require [extended attributes](/extended-attributes/).

##### Example

~~~json
{
  "registrant_id": 1
}
~~~

### Response

Responds with HTTP 201 on success, returns the domain.

~~~json
<%= pretty_print_fixture("/register/success.http") %>
~~~

Responds with HTTP 400 if the validation fails.


## Transfer a domain {#transfer}

    POST /:account/registrar/domains/:domain/transfer

Transfer a domain name from another domain registrar into DNSimple.

Your account must be active for this command to complete successfully.
You will be automatically charged the 1-year transfer fee upon successful transfer, so please be careful with this command.
The transfer may take anywhere from a few minutes up to 7 days.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name

### Example

Transfer the domain example.com in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/transfer

### Input

Name | Type | Description
-----|------|------------
`registrant_id` | `integer` | **Required**. The ID of an existing contact in your account.
`auth_info` | `string` | **Required** for TLDS that require authorization-based transfer (the vast majority of TLDs).
`extended_attributes` | `hash` | **Required** for TLDs that require [extended attributes](/v2/registrar/tlds/#extended-attributes/).

##### Example

~~~json
{
  "registrant_id": 1,
  "auth_info": "xjfjfjvhc293"
}
~~~

##### Example with extended attributes

~~~json
{
  "registrant_id": 1,
  "auth_info": "xjfjfjvhc293",
  "extended_attribute": {
    "us_nexus": "C11",
    "us_purpose": "P3"
  }
}
~~~

### Response

Responds with HTTP 201 on success, returns the domain.

~~~json
<%= pretty_print_fixture("/transfer/success.http") %>
~~~

Responds with HTTP 400 if the validation fails.


## Renew a domain {#renew}

    POST /:account/registrar/domains/:domain/renewal

Renew a domain name already registered with DNSimple.

Your account must be active for this command to complete successfully.
You will be automatically charged the renewal fee upon successful renewal, so please be careful with this command.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name

### Example

Renew the domain example.com in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/renewal

### Input

Name | Type | Description
-----|------|------------
`period` | `integer` | The number of years. Unless specified it will default to whatever value is set for the TLD.

##### Example with optional period

~~~json
{
  "period": 2
}
~~~

### Response

Responds with HTTP 201 on success, returns the domain.

~~~json
<%= pretty_print_fixture("/renew/success.http") %>
~~~

Responds with HTTP 400 if the validation fails.


## Transfer out a domain {#transfer-out}

    POST /:account/registrar/domains/:domain/transfer_out

Prepare a domain for transferring out. This will unlock a domain and send the authorization code to the domain's administrative contact.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name

### Example

Transfer out the domain example.com in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/transfer_out

### Response

Responds with HTTP 204 on success.

Responds with HTTP 400 if the validation fails.
