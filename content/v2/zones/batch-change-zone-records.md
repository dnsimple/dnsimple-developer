---
title: Batch Change Zone Records API | DNSimple API v2
excerpt: This page documents the DNSimple batch change zone records API v2.
---

# Batch Change Zone Records API

* TOC
{:toc}


## Batch change zone records {#batchChangeZoneRecords}

<%= render "/v2-preview-endpoint.*" %>

```
POST /:account/zones/:zone/batch
```

This endpoint allows you to perform multiple record operations (create, update, and/or delete) for a zone in a single request for efficiency and atomicity. Any combination of create, update, and/or delete operations can be specified, though the total number of operations per request is subject to a maximum limit. Operations are processed in the following order: deletes, followed by updates, then creates.

> [!NOTE]
> Zones linked to [Integrated DNS Providers](https://support.dnsimple.com/articles/integrated-dns-providers/) do not support batch changes.

> [!NOTE]
> The batch change zone records API feature is only available on the Enterprise plan.
> If the feature is not enabled, you will receive an HTTP 412 response code.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:zone` | `string` | The zone name

### Example

Perform a batched change on records for the zone `example.com` in the account `1010`:

```shell
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      -H 'Content-Type: application/json' \
      -X POST \
      -d '<json>' \
      https://api.dnsimple.com/v2/1010/zones/example.com/batch
```

### Input

All operation types are optional. You can specify any combination of `creates`, `updates`, and `deletes`, as long as you respect the maximum batch size.

Name | Type | Description
-----|------|------------
`creates` | `array` | Optional. Array of zone records to create
`updates` | `array` | Optional. Array of zone records to update
`deletes` | `array` | Optional. Array of zone record IDs to delete

#### Creates

Each item in the `creates` array represents a record to be created and has the following fields:

Name | Type | Description
-----|------|------------
`name` | `string` | **Required**. The record name, without the domain. The domain will be automatically appended. Use an empty string to create a record for the apex.
`type` | `string` | **Required**.
`content` | `string` | **Required**.
`ttl` | `integer` |
`priority` | `integer` |
`regions` | `array` | Optional set of [regions](#zone-record-regions)

#### Updates

Each item in the `updates` array represents a record to be updated and has the following fields:

Name | Type | Description
-----|------|------------
`id` | `integer` | **Required**. The ID of the zone record to update
`name` | `string` |  The record name, without the domain. The domain will be automatically appended. Use an empty string to create a record for the apex.
`content` | `string` |
`ttl` | `integer` |
`priority` | `integer` |
`regions` | `array` | Optional set of [regions](#zone-record-regions)

#### Deletes

Each item in the `deletes` array requires only an `id` field:

Name | Type | Description
-----|------|------------
`id` | `integer` | **Required**. The ID of the zone record to delete

##### Example

```json
{
  "creates": [
    {
      "name": "ab",
      "type": "A",
      "content": "3.2.3.4",
      "ttl": 3600
    },
    {
      "name": "ab",
      "type": "A",
      "content": "4.2.3.4",
      "ttl": 3600
    }
  ],
  "updates": [
    {
      "id": 67622534,
      "content": "3.2.3.40"
    },
    {
      "id": 67622537,
      "content": "5.2.3.40"
    }
  ],
  "deletes": [
    {
      "id": 67622509
    },
    {
      "id": 67622527
    }
  ]
}
```

### Response

Responds with HTTP 200 on success.

```json
<%= pretty_print_fixture("/api/batchChangeZoneRecords/success.http") %>
```

### Errors

Responds with [HTTP 400](/v2/#bad-request) if validation fails for an operation. The error response includes details about the failed operation:

```json
<%= pretty_print_fixture("/api/batchChangeZoneRecords/error_400_create_validation_failed.http") %>
```

```json
<%= pretty_print_fixture("/api/batchChangeZoneRecords/error_400_update_validation_failed.http") %>
```

```json
<%= pretty_print_fixture("/api/batchChangeZoneRecords/error_400_delete_validation_failed.http") %>
```

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.

Responds with [HTTP 404](/v2/#not-found) if the zone is not found.
