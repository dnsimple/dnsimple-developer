---
title: Secondary DNS API | DNSimple API v2
excerpt: This page documents the DNSimple secondary DNS API v2.
---

# Secondary DNS API

### Table of Contents {#toc}

* TOC
{:toc}

<note>
  This endpoint is currently in Private Beta. During the Private Beta period changes may occur at any time.
</note>

## Primary Server attributes {#primary-server-attributes}

Please refer to the definition of the `PrimaryServer` data type in [our OpenAPI documentation](/v2/openapi.yml).


## List primary servers {#listPrimaryServers}

    GET /:account/secondary_dns/primaries

List primary servers for in the account.

### Parameters

| Name       | Type      | Description    |
| ---------- | --------- | -------------- |
| `:account` | `integer` | The account id |

### Example

List all primary servers in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/secondary_dns/primaries

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/api/listPrimaryServers/success.http") %>
~~~

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

| Name   | Description                                      |
| ------ | ------------------------------------------------ |
| `id`   | Sort primary servers by ID                       |
| `name` | Sort primary serves by name (alphabetical order) |

The default sorting policy is by ascending `id`.


## Create a primary server {#createPrimaryServer}

    POST /:account/secondary_dns/primaries

### Parameters

| Name       | Type      | Description    |
| ---------- | --------- | -------------- |
| `:account` | `integer` | The account id |

### Example

Create a primary server in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/secondary_dns/primaries

### Input

| Name   | Type      | Description                                   |
| ------ | --------- | --------------------------------------------- |
| `name` | `string`  | **Required**. The name of the primary server. |
| `ip`   | `string`  | **Required**. The IP of the primary server.   |
| `port` | `integer` | The port of the primary server.               |

##### Example

~~~json
{
  "name": "Primary Production",
  "ip": "1.2.3.4",
  "port": 4567
}
~~~

### Response

Responds with HTTP 201 on success, renders the primary server.

~~~json
<%= pretty_print_fixture("/api/createPrimaryServer/created.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Retrieve a Primary Server {#getPrimaryServer}

    GET /:account/secondary_dns/primaries/:primary_server

### Parameters

| Name              | Type      | Description           |
| ----------------- | --------- | --------------------- |
| `:account`        | `integer` | The account id        |
| `:primary_server` | `integer` | The primary server id |

### Example

Get the primary server with the ID `1` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/secondary_dns/primaries/1

### Response

Responds with HTTP 200, renders the primary server.

~~~json
<%= pretty_print_fixture("/api/getPrimaryServer/success.http") %>
~~~


## Delete primary server {#removePrimaryServer}

    DELETE /:account/secondary_dns/primaries/:primary_server

Delete the primary server from the account.

### Parameters

| Name              | Type      | Description           |
| ----------------- | --------- | --------------------- |
| `:account`        | `integer` | The account id        |
| `:primary_server` | `integer` | The primary server id |

### Example

Delete the primary server with ID `1` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/secondary_dns/primaries/1

### Response

Responds with HTTP 204 on success.

Responds with HTTP 404 if primary server is not found.

## Link a primary server to a secondary zone {#linkPrimaryServer}

    PUT /:account/secondary_dns/primaries/:primary_server/link

### Parameters

| Name              | Type      | Description           |
| ----------------- | --------- | --------------------- |
| `:account`        | `integer` | The account id        |
| `:primary_server` | `integer` | The primary server id |

### Example

Link the primary server `1` to a secondary zone `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/secondary_dns/primaries/1/link

### Input

| Name   | Type     | Description                                                           |
| ------ | -------- | --------------------------------------------------------------------- |
| `zone` | `string` | **Required**. The zone name to link with. Should be a secondary zone. |

##### Example

~~~json
{
  "zone": "example.com"
}
~~~

### Response

Responds with HTTP 200 on success, renders the primary server. The linked zone will be present in the `linked_secondary_zones` attribute.

~~~json
<%= pretty_print_fixture("/api/linkPrimaryServer/success.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.

Responds with HTTP 404 if the zone or the primary server is not found.


## Unlink a primary server from a secondary zone {#unlinkPrimaryServer}

    PUT /:account/secondary_dns/primaries/:primary_server/unlink

### Parameters

| Name              | Type      | Description           |
| ----------------- | --------- | --------------------- |
| `:account`        | `integer` | The account id        |
| `:primary_server` | `integer` | The primary server id |

### Example

Unlink the primary server `1` from a secondary zone `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/secondary_dns/primaries/1/unlink

### Input

| Name   | Type     | Description                                                             |
| ------ | -------- | ----------------------------------------------------------------------- |
| `zone` | `string` | **Required**. The zone name to unlink from. Should be a secondary zone. |

##### Example

~~~json
{
  "zone": "example.com"
}
~~~

### Response

Responds with HTTP 200 on success, renders the primary server.

~~~json
<%= pretty_print_fixture("/api/unlinkPrimaryServer/success.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.

Responds with HTTP 404 if the zone or the primary server is not found.

## Create a secondary zone {#createSecondaryZone}

    POST /:account/secondary_dns/zones

### Parameters

| Name       | Type      | Description    |
| ---------- | --------- | -------------- |
| `:account` | `integer` | The account id |

### Example

Create a secondary zone in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/secondary_dns/zones

### Input

| Name   | Type     | Description                                   |
| ------ | -------- | --------------------------------------------- |
| `name` | `string` | **Required**. The name of the secondary zone. |

##### Example

~~~json
{
  "name": "secondaryexample.com"
}
~~~

### Response

Responds with HTTP 201 on success, renders the secondary zone. The attribute `secondary` will be true.

~~~json
<%= pretty_print_fixture("/api/createSecondaryZone/created.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.

## Delete secondary zone {#removeSecondaryZone}

Please refer to the [`Domain` deletion endpoint](/v2/domains/#deleteDomain)
