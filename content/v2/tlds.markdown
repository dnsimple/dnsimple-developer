---
title: TLDs API | DNSimple API v2 (Beta)
excerpt: This page documents the DNSimple TLDs API v2.
---

# TLDs API

* TOC
{:toc}


## TLD attributes

Name | Type | Description
-----|------|------------
`tld`                   | `string`  | the registerable suffix. In most cases the suffix matches a TLD, but there are some cases where the suffix is a subzone of the TLD (e.g. `com.au`).
`tld_type`              | `integer` | the type of TLD. See [TLD types](#tld-types).
`minimum_registration`  | `integer` | the minimum RTR period, in years.
`whois_privacy`         | `bool`    | `true` if the suffix allows WHOIS privacy as a separate component. Some registries may provide WHOIS privacy at registry level, such as the .IO or .UK.
`auto_renew_only`       | `bool`    | `true` if the suffix requires auto-renewal and can't be renewed manually.
`idn`                   | `bool`    | `true` if the suffix supports Internationalized Domain Names (IDN).
`registration_enabled`  | `bool`    | `true` if DNSimple supports registrations for this TLD.
`renewal_enabled`       | `bool`    | `true` if DNSimple supports renewals for this TLD.
`transfer_enabled`      | `bool`    | `true` if DNSimple supports inbound transfers for this TLD.

### TLD Types {#tld-types}

Value | Description
------|------------
`1`   | `gTLD` (global TLD)
`2`   | `ccTLD` (country-code TLD)
`3`   | `newTLD` (new global TLD)


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

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`tld` | Sort TLDs by tld

The default sorting policy is by ascending `tld`.


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
<%= pretty_print_fixture("/getTldExtendedAttributes/success.http") %>
~~~
