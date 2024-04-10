---
title: Zones API | DNSimple API v2
excerpt: This page documents the DNSimple zones API v2.
---

# Zones API

* TOC
{:toc}


## Zone attributes {#zones-attributes}

Please refer to the definition of the `Zone` data type in [our OpenAPI documentation](/v2/openapi.yml).


## List zones {#listZones}

Lists the zones in the account.

~~~
GET /:account/zones
~~~

### Parameters

| Name       | Type      | Description    |
| ---------- | --------- | -------------- |
| `:account` | `integer` | The account id |

### Filters

| Name         | Description                                |
| ------------ | ------------------------------------------ |
| `:name_like` | Only include zones containing given string |

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

| Name   | Description                             |
| ------ | --------------------------------------- |
| `id`   | Sort zones by ID                        |
| `name` | Sort zones by name (alphabetical order) |

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

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/listZones/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.

## Retrieve a zone {#getZone}

~~~
GET /:account/zones/:zone
~~~

### Parameters

| Name       | Type      | Description    |
| ---------- | --------- | -------------- |
| `:account` | `integer` | The account id |
| `:zone`    | `string`  | The zone name  |

### Example

Get the zone `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/zones/example.com

### Response

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/getZone/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.

## Download a zone file {#getZoneFile}

    GET /:account/zones/:zone/file

### Parameters

| Name       | Type      | Description    |
| ---------- | --------- | -------------- |
| `:account` | `integer` | The account id |
| `:zone`    | `string`  | The zone name  |

### Example

Get the zone file `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/zones/example.com/file

### Response

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/getZoneFile/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.

## Check zone distribution {#checkZoneDistribution}

    GET /:account/zones/:zone/distribution

Checks if a zone change is fully distributed to all our nameservers across the globe.

<note>
This feature can't be tested in our <a href="/sandbox">Sandbox</a> environment.
</note>

### Parameters

| Name       | Type      | Description    |
| ---------- | --------- | -------------- |
| `:account` | `integer` | The account id |
| `:zone`    | `string`  | The zone name  |

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

### Errors

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.

Responds with [HTTP 504](/v2/#gateway-timeout) when the server failed to perform the check.

~~~json
<%= pretty_print_fixture("/api/checkZoneDistribution/error.http") %>
~~~

## Activate DNS services for the zone {#activateZoneService}

<%= render "v2-preview-endpoint" %>

    PUT /:account/zones/:zone/activation

Activates DNS services for the zone.

<note>
Under Solo and Teams plans, active zones are charged when renewing your subscription to DNSimple.
</note>

### Parameters

| Name       | Type      | Description    |
| ---------- | --------- | -------------- |
| `:account` | `integer` | The account id |
| `:zone`    | `string`  | The zone name  |

### Example

Activate DNS services for `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X PUT \
          https://api.dnsimple.com/v2/1010/zones/example.com/activation

### Response

Responds with HTTP 200 when the zone was successfully activated.

~~~json
<%= pretty_print_fixture("/api/activateZoneService/success.http") %>
~~~

### Errors

Responds with [HTTP 404](/v2#not-found) if the resource does not exist.

## Deactivate DNS services for the zone {#deactivateZoneService}

<%= render "v2-preview-endpoint" %>

    DELETE /:account/zones/:zone/activation

Deactivates DNS services for the zone.

<note>
Under Solo and Teams plans, active zones are charged when renewing your subscription to DNSimple.
</note>

### Parameters

| Name       | Type      | Description    |
| ---------- | --------- | -------------- |
| `:account` | `integer` | The account id |
| `:zone`    | `string`  | The zone name  |

### Example

Activate DNS services for `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/zones/example.com/activation

### Response

Responds with HTTP 200 when the zone has been successfully deactivated.

~~~json
<%= pretty_print_fixture("/api/deactivateZoneService/success.http") %>
~~~

### Errors

Responds with [HTTP 404](/v2#not-found) if the resource does not exist.
