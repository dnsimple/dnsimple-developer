---
title: Domain templates API | Templates | DNSimple API v2
excerpt: This page documents the DNSimple domain templates API v2.
---

# Domain templates API

* TOC
{:toc}


## Apply a template {#applyTemplateToDomain}

Applies a template to a domain.

~~~
POST /:account/domains/:domain/templates/:template
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:template` | `string`, `integer` | The template id or short name

### Example

Apply the template with the ID `1` in the domain `example.com`, in the account `1010`:

~~~
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      -H 'Content-Type: application/json' \
      -X POST \
      https://api.dnsimple.com/v2/1010/domains/example.com/templates/1
~~~

### Response

Responds with HTTP 204 on success.

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the template cannot be applied to the domain.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.