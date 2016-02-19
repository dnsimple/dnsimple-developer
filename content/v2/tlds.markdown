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

## Get TLD Extended Attributes {#extended-attributes}

    GET /tlds/:tld/extended_attributes

Some TLDs require extended attributes when registering or transferring a domain.
This API interface provides information on the extended attributes for any particular TLD.

Extended attributes are extra TLD-specific attributes, required by the TLD registry to collect extra information about the registrant or legal agreements.

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
