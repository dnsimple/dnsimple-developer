---
title: Zones | DNSimple API v2
excerpt: This page documents the DNSimple zones API v2.
---

# Zones API

* TOC
{:toc}


## List zones {#list}

    GET /:account/zones

List zones for the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

List all zones for the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/zones

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/listZones/success.http") %>
~~~


## Get a zone {#get}

    GET /:account/zones/:zone

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id or wildcard (`_`)
`:zone` | `string` | The zone name

### Example

Get the zone `example.com` for the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/zones/example.com

### Response

Responds with HTTP 200, renders the zone.

~~~json
<%= pretty_print_fixture("/getZone/success.http") %>
~~~

