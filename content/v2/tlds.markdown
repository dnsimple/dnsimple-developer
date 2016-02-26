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
<%= pretty_print_fixture("/listTlds/success.http") %>
~~~

### TLD Types

Value | Type
------|-----
`1`   | `gTLD`
`2`   | `ccTLD`
`3`   | `newTLD`

## Attributes meaning

minimum_registration
: the minimum RTR period, in years.

whois_privacy
: true if the suffix allows WHOIS privacy as a separate component.
  Some registries may provide WHOIS privacy at registry level, such as the .IO or .UK.

auto_renew_only
: true if the suffix requires auto-renewal and can't be renewed manually.

idn
: true if the suffix supports Internationalized Domain Names (IDN).


## Get TLD details {#get}

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
<%= pretty_print_fixture("/getTld/success.http") %>
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
