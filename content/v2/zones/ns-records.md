---
title: Zone NS Records API | Zones | DNSimple API v2
excerpt: This page documents the DNSimple domain name servers API v2.
---

# Zone NS Records API

<%= render "/v2-public-beta-feature.*" %>

* TOC
{:toc}


## Update zone NS records {#updateZoneNsRecords}


    PUT /:account/zones/:zone/ns_records

Update the NS records for a zone in a hosted domain in the account.

> [!NOTE]
> If vanity name servers are enabled for the domain, please ensure that they are included in the name server name parameters or referenced name server sets, for the vanity name server configuration to stay effective.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:zone` | `string`, `integer` | The zone name or id

### Example

> [!NOTE]
> This example assumes that name server set #1 includes `ns1.foo.bar` and `ns2.foo.bar`.

Update the NS records for the zone `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT \
          -d '{
            "ns_names": ["ns1.example.com", "ns2.example.com"],
            "ns_set_ids": [1]
          }' \
          https://api.dnsimple.com/v2/1010/zones/example.com/ns_records

### Input

Name | Type | Description
-----|------|------------
`ns_names` | `array` | A list of name server names as strings.
`ns_set_ids` | `array` | A list of name server set IDs.

### Response

Responds with HTTP 200, including the zone's NS records as defined in [our OpenAPI documentation](/v2/openapi.yml).

```json
<%= pretty_print_fixture("/api/updateZoneNsRecords/success.http") %>
```

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the NS records cannot be set for the zone.

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.

Responds with [HTTP 402](/v2/#payment-required) if the account has outstanding payments.

Responds with [HTTP 404](/v2/#unauthorized) if the zone or name server sets are not in the account.

Responds with [HTTP 412](/v2/#precondition-failed) if the account doesn't have access to the name server sets feature.
