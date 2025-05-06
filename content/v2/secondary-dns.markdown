---
title: Secondary DNS API | DNSimple API v2
excerpt: This page documents the DNSimple secondary DNS API v2.
---

# Secondary DNS API

<%= render "v2-public-beta-feature" %>

### Table of Contents {#toc}

* TOC
{:toc}

## Primary Server attributes {#primary-server-attributes}

Please refer to the definition of the `PrimaryServer` data type in [our OpenAPI documentation](/v2/openapi.yml).


## List primary servers {#listPrimaryServers}

    GET /:account/secondary_dns/primaries

List primary servers for in the account.

### Parameters

| Name       | Type      | Description    |
| ---------- | --------- | -------------- |
| `:account` | `integer` | The account id |

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

| Name   | Description                                      |
| ------ | ------------------------------------------------ |
| `id`   | Sort primary servers by ID                       |
| `name` | Sort primary serves by name (alphabetical order) |

The default sorting policy is by ascending `id`.

### Example

List all primary servers in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/secondary_dns/primaries

### Response

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/listPrimaryServers/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.


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

### Errors

Responds with [HTTP 400](/v2#bad-request) if the primary server cannot be created.

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.


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

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/getPrimaryServer/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.

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

### Errors

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.

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

Responds with HTTP 200 on success. The linked zone will be present in the `linked_secondary_zones` attribute.

~~~json
<%= pretty_print_fixture("/api/linkPrimaryServer/success.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2#bad-request) if the primary server cannot be linked to the secondary zone.

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.


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

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/unlinkPrimaryServer/success.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2#bad-request) if the primary server cannot be unlinked from the secondary zone.

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.

## Create a secondary zone {#createSecondaryZone}

    POST /:account/secondary_dns/zones

<note>
When creating a secondary zone using Solo or Teams subscription, the DNS services
for the zone will be automatically enabled. This will be charged on your
following subscription renewal invoices.
</note>

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

Responds with HTTP 201 on success. The attribute `secondary` will be true.

~~~json
<%= pretty_print_fixture("/api/createSecondaryZone/created.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2#bad-request) if the secondary zone cannot be created.

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.

Reponds with **HTTP 406** if a domain ownership verification is required. To verify ownership, delegate the domain to the verification name servers displayed in the error message. You will receive an email when the domain ownership is verified. Verifications expire after 48 hours.

## Delete secondary zone {#removeSecondaryZone}

Please refer to the [`Domain` deletion endpoint](/v2/domains/#deleteDomain)
