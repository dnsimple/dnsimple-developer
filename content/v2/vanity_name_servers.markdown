---
title: Vanity Name Servers | DNSimple API v2
excerpt: This page documents the DNSimple contacts API v2.
---

# Vanity Name Servers API

* TOC
{:toc}


## Enable {#enable}

    PUT /:account/vanity/:domain

Enable Vanity Name Servers for the domain.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Enable Vanity Name Servers for the domain example.com in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT \
          https://api.dnsimple.com/v2/1010/vanity/example.com

### Response

Responds with HTTP 200 on success.

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the delegation fails.

~~~json
~~~

## Disable {#disable}

    DELETE /:account/vanity/:domain

Disable Vanity Name Servers for the domain.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Enable Vanity Name Servers for the domain example.com in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/vanity/example.com

### Response

Responds with HTTP 204 on success.

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the dedelegation fails.
