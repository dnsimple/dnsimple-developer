---
title: Zones API | DNSimple API v2
excerpt: This page documents the DNSimple zones API v2.
---

# Zones API

* TOC
{:toc}


## Contact attributes {#zones-attributes}

Please refer to the definition of the `Zone` data type in [our OpenAPI documentation](/v2/openapi.yml).


## List zones {#listZones}

~~~
GET /:account/zones
~~~

List zones in the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Filters

Name | Description
-----|------------
`:name_like` | Only include zones containing given string

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort zones by ID
`name` | Sort zones by name (alphabetical order)

The default sorting policy is by ascending `name`.

### Examples

List all zones in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/zones

List all zones in the account `1010` that have name matching `"example"`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/zones?name_like=example

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/api/listZones/success.http") %>
~~~


## Get a zone {#getZone}

    GET /:account/zones/:zone

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:zone` | `string` | The zone name

### Example

Get the zone `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/zones/example.com

### Response

Responds with HTTP 200, renders the zone.

~~~json
<%= pretty_print_fixture("/api/getZone/success.http") %>
~~~

## Get a zone file {#getZoneFile}

    GET /:account/zones/:zone/file

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:zone` | `string` | The zone name

### Example

Get the zone file `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/zones/example.com/file

### Response

Responds with HTTP 200, renders the zone file.

~~~json
<%= pretty_print_fixture("/api/getZoneFile/success.http") %>
~~~


## Check zone distribution {#checkZoneDistribution}

    GET /:account/zones/:zone/distribution

Checks if a zone change is fully distributed to all our nameservers across the globe.

<note>
This feature can't be tested in our <a href="/sandbox">Sandbox</a> environment.
</note>

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:zone` | `string` | The zone name

### Example

Check the zone distribution for `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/zones/example.com/distribution

### Response

Responds with HTTP 200 when the zone is fully distributed.

~~~json
<%= pretty_print_fixture("/api/checkZoneDistribution/success.http") %>
~~~

Responds with HTTP 200 when the zone is not distributed.

~~~json
<%= pretty_print_fixture("/api/checkZoneDistribution/failure.http") %>
~~~

Responds with HTTP 504 when the server failed to perform the check.

~~~json
<%= pretty_print_fixture("/api/checkZoneDistribution/error.http") %>
~~~
