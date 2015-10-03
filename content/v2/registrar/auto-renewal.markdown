---
title: Domain registration auto-renewal
excerpt: This page documents the DNSimple domain registration auto-renewal API v2.
---

# Domain registration auto-renewal API

* TOC
{:toc}


## Enable domain auto-renewal {#enable}

    PUT /:account/domains/:domain/auto_renewal

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:domain` | `string`, `integer` | The domain name or id

### Example

Enable auto-renewal for the domain `example.com`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT \
          https://api.dnsimple.com/v2/_/domains/example.com/auto_renewal

### Response

Responds with HTTP 204 on success.


## Disable domain auto-renewal {#disable}

    DELETE /:account/domains/:domain/auto_renewal

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:domain` | `string`, `integer` | The domain name or id

### Example

Disable auto-renewal for the domain `example.com`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/_/domains/example.com/auto_renewal

### Response

Responds with HTTP 204 on success.
