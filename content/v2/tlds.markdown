---
title: TLDs API | DNSimple API v2
excerpt: This page documents the DNSimple TLDs API v2.
---

# TLDs API

* TOC
{:toc}


## TLD attributes {#tld-attributes}

Please refer to the definition of the `TLD` data type in [our OpenAPI documentation](/v2/openapi.yml).

## TLD Types {#tld-types}

Value | Description
------|------------
`1`   | `gTLD` (global TLD)
`2`   | `ccTLD` (country-code TLD)
`3`   | `newTLD` (new global TLD)


## List TLDs {#listTlds}

Returns the list of TLDs supported for registration or transfer.

~~~
GET /tlds
~~~

### Example

List all TLDs.

~~~shell
curl -H 'Authorization: Bearer <token>' \
        -H 'Accept: application/json' \
        https://api.dnsimple.com/v2/tlds
~~~

### Response

~~~json
<%= pretty_print_fixture("/api/listTlds/success.http") %>
~~~

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`tld` | Sort TLDs by tld

The default sorting policy is by ascending `tld`.


## Retrieve the TLD {#getTld}

Retrieves the details of a supported TLD.

~~~
GET /tlds/:tld
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:tld` | `string` | The TLD name

### Example

Get the TLD with name `"com"`.

~~~shell
curl -H 'Authorization: Bearer <token>' \
        -H 'Accept: application/json' \
        https://api.dnsimple.com/v2/tlds/com
~~~

### Response

~~~json
<%= pretty_print_fixture("/api/getTld/success.http") %>
~~~


## Lists the TLD Extended Attributes {#getTldExtendedAttributes}

~~~
GET /tlds/:tld/extended_attributes
~~~

Some TLDs require extended attributes when registering or transferring a domain.
This API interface provides information on the extended attributes for any particular TLD.

Extended attributes are extra TLD-specific attributes, required by the TLD registry to collect extra information about the registrant or legal agreements.

### Parameters

Name | Type | Description
-----|------|------------
`:tld` | `string` | The TLD name

### Example

Get extended attributes for TLD with name `"com"`.

~~~shell
curl -H 'Authorization: Bearer <token>' \
        -H 'Accept: application/json' \
        https://api.dnsimple.com/v2/tlds/com/extended_attributes
~~~

### Response

~~~json
<%= pretty_print_fixture("/api/getTldExtendedAttributes/success.http") %>
~~~
