---
title: TLDs | DNSimple API v2
excerpt: This page documents the DNSimple TLDs API v2.
---

# TLDs API

* TOC
{:toc}


## List TLDs {#list}

    GET /tlds

### Example

List all TLDs.

    curl -H 'Authorization: Bearer <token>' \
         -H 'Accept: application/json' \
         https://api.dnsimple.com/v2/tlds

### Response

~~~json
~~~

### TLD Types

Value | Type
------|-----
`1`   | `gTLD`
`2`   | `ccTLD`
`3`   | `newTLD`

## Get a TLD {#get}

    GET /tlds/:tld

### Parameters

Name | Type | Description
-----|------|------------
`:tld` | `string` | The TLD name

### Example

Get the TLD with name `"com"`.

    curl -H 'Authorization: Bearer <token>' \
         -H 'Accept: application/json' \
         https://api.dnsimple.com/v2/tlds/com

### Response

~~~json
~~~

## Get TLD Extended Attributes {#extendedAttributes}

    GET /tlds/:tld/extended_attributes

### Parameters

Name | Type | Description
-----|------|------------
`:tld` | `string` | The TLD name

### Example

Get extended attributes for TLD with name `"com"`.

    curl -H 'Authorization: Bearer <token>' \
         -H 'Accept: application/json' \
         https://api.dnsimple.com/v2/tlds/com/extended_attributes

### Response

~~~json
~~~
