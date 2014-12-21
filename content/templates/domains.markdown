---
title: Applied Templates
---

# Applied Template API

* TOC
{:toc}


## Apply a template {#apply}

Apply the specific template to the domain.

    POST /domains/:domain/templates/:template/apply

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id
`:template` | `integer`,`string` | The template id or short-name

### Example

Apply template `2` to domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://api.dnsimple.com/v1/domains/example.com/templates/2/apply

### Response

Responds with HTTP 200 on success.
