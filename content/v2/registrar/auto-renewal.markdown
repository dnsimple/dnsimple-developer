---
title: Domain auto-renewal API | Registrar | DNSimple API v2 (Beta)
excerpt: This page documents the DNSimple domain registration auto-renewal API v2.
---

# Domain auto-renewal API

* TOC
{:toc}


## Enable domain auto-renewal {#enable}

    PUT /:account/registrar/domains/:domain/auto_renewal

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Enable auto-renewal for the domain `example.com` from the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/auto_renewal

### Response

Responds with HTTP 204 on success.


## Disable domain auto-renewal {#disable}

    DELETE /:account/registrar/domains/:domain/auto_renewal

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Disable auto-renewal for the domain `example.com` from the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/auto_renewal

### Response

Responds with HTTP 204 on success.
