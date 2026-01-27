# DNSimple API Client Inconsistencies Report

This report identifies endpoints that are not consistently implemented across all DNSimple API clients and outlines the changes required for each client to achieve feature parity.

**Date:** 2026-01-27

## Executive Summary

| Client | Missing Endpoints |
|--------|:-----------------:|
| Ruby   |                 7 |
| Go     |                 7 |
| Python |                 7 |
| Node   |                 9 |
| PHP    |                10 |
| Java   |                10 |
| Elixir |                10 |
| C#     |                10 |
| Rust   |                11 |

## Inconsistency Overview

| Endpoint                    | Ruby | Go | Python | Node | PHP | Java | Elixir | C# | Rust |
|-----------------------------|:----:|:--:|:------:|:----:|:---:|:----:|:------:|:--:|:----:|
| Domain Restore (POST)       |  ✓   | ✓  |   ✓    |  ✗   |  ✗  |  ✗   |   ✗    | ✗  |  ✗   |
| Get Domain Restore          |  ✓   | ✓  |   ✓    |  ✗   |  ✗  |  ✗   |   ✗    | ✗  |  ✗   |
| Batch Change Zone Records   |  ✓   | ✓  |   ✓    |  ✗   |  ✗  |  ✗   |   ✗    | ✗  |  ✗   |
| DNS Analytics Query         |  ✓   | ✓  |   ✓    |  ✗   |  ✗  |  ✗   |   ✗    | ✗  |  ✗   |
| Secondary DNS (7 endpoints) |  ✗   | ✗  |   ✗    |  ✓   |  ✗  |  ✗   |   ✗    | ✗  |  ✗   |
| Billing (List Charges)      |  ✓   | ✓  |   ✓    |  ✓   |  ✓  |  ✓   |   ✓    | ✓  |  ✗   |

**Legend:** ✓ = Implemented, ✗ = Missing

## Changes Required Per Client

### Node.js (`dnsimple-node`)

**Repository:** https://github.com/dnsimple/dnsimple-node

**Missing Endpoints (9):**

#### Priority (from ticket #174)

1. **Restore Domain**
   - Method: `restoreDomain`
   - HTTP: `POST /{account}/registrar/domains/{domain}/restores`
   - Reference: https://developer.dnsimple.com/v2/registrar/#restoreDomain

2. **Get Domain Restore**
   - Method: `getDomainRestore`
   - HTTP: `GET /{account}/registrar/domains/{domain}/restores/{restore}`
   - Reference: https://developer.dnsimple.com/v2/registrar/#getDomainRestore

#### Additional Missing Endpoints

3. **Batch Change Zone Records**
   - Method: `batchChangeZoneRecords`
   - HTTP: `POST /{account}/zones/{zone}/batch`
   - Reference: https://developer.dnsimple.com/v2/zones/records/#batchChangeZoneRecords

4. **DNS Analytics Query**
   - Method: `queryDnsAnalytics`
   - HTTP: `GET /{account}/dns_analytics`
   - Reference: https://developer.dnsimple.com/v2/dns-analytics/#queryDnsAnalytics

### PHP (`dnsimple-php`)

**Repository:** https://github.com/dnsimple/dnsimple-php

**Missing Endpoints (10):**

#### Priority (from ticket #174)

1. **Restore Domain**
   - Method: `restoreDomain`
   - HTTP: `POST /{account}/registrar/domains/{domain}/restores`
   - Reference: https://developer.dnsimple.com/v2/registrar/#restoreDomain

2. **Get Domain Restore**
   - Method: `getDomainRestore`
   - HTTP: `GET /{account}/registrar/domains/{domain}/restores/{restore}`
   - Reference: https://developer.dnsimple.com/v2/registrar/#getDomainRestore

#### Additional Missing Endpoints

3. **Batch Change Zone Records**
   - Method: `batchChangeZoneRecords`
   - HTTP: `POST /{account}/zones/{zone}/batch`
   - Reference: https://developer.dnsimple.com/v2/zones/records/#batchChangeZoneRecords

4. **DNS Analytics Query**
   - Method: `queryDnsAnalytics`
   - HTTP: `GET /{account}/dns_analytics`
   - Reference: https://developer.dnsimple.com/v2/dns-analytics/#queryDnsAnalytics

5. **Secondary DNS - List Primary Servers**
   - Method: `listPrimaryServers`
   - HTTP: `GET /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#listPrimaryServers

6. **Secondary DNS - Create Primary Server**
   - Method: `createPrimaryServer`
   - HTTP: `POST /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createPrimaryServer

7. **Secondary DNS - Get Primary Server**
   - Method: `getPrimaryServer`
   - HTTP: `GET /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#getPrimaryServer

8. **Secondary DNS - Remove Primary Server**
   - Method: `removePrimaryServer`
   - HTTP: `DELETE /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#removePrimaryServer

9. **Secondary DNS - Link Primary Server**
   - Method: `linkPrimaryServer`
   - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/link`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#linkPrimaryServer

10. **Secondary DNS - Unlink Primary Server**
    - Method: `unlinkPrimaryServer`
    - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/unlink`
    - Reference: https://developer.dnsimple.com/v2/secondary-dns/#unlinkPrimaryServer

11. **Secondary DNS - Create Secondary Zone**
    - Method: `createSecondaryZone`
    - HTTP: `POST /{account}/secondary_dns/zones`
    - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createSecondaryZone

### Java (`dnsimple-java`)

**Repository:** https://github.com/dnsimple/dnsimple-java

**Missing Endpoints (10):**

#### Priority (from ticket #174)

1. **Restore Domain**
   - Method: `restoreDomain`
   - HTTP: `POST /{account}/registrar/domains/{domain}/restores`
   - Reference: https://developer.dnsimple.com/v2/registrar/#restoreDomain

2. **Get Domain Restore**
   - Method: `getDomainRestore`
   - HTTP: `GET /{account}/registrar/domains/{domain}/restores/{restore}`
   - Reference: https://developer.dnsimple.com/v2/registrar/#getDomainRestore

#### Additional Missing Endpoints

3. **Batch Change Zone Records**
   - Method: `batchChangeZoneRecords`
   - HTTP: `POST /{account}/zones/{zone}/batch`
   - Reference: https://developer.dnsimple.com/v2/zones/records/#batchChangeZoneRecords

4. **DNS Analytics Query**
   - Method: `queryDnsAnalytics`
   - HTTP: `GET /{account}/dns_analytics`
   - Reference: https://developer.dnsimple.com/v2/dns-analytics/#queryDnsAnalytics

5. **Secondary DNS - List Primary Servers**
   - Method: `listPrimaryServers`
   - HTTP: `GET /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#listPrimaryServers

6. **Secondary DNS - Create Primary Server**
   - Method: `createPrimaryServer`
   - HTTP: `POST /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createPrimaryServer

7. **Secondary DNS - Get Primary Server**
   - Method: `getPrimaryServer`
   - HTTP: `GET /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#getPrimaryServer

8. **Secondary DNS - Remove Primary Server**
   - Method: `removePrimaryServer`
   - HTTP: `DELETE /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#removePrimaryServer

9. **Secondary DNS - Link Primary Server**
   - Method: `linkPrimaryServer`
   - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/link`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#linkPrimaryServer

10. **Secondary DNS - Unlink Primary Server**
    - Method: `unlinkPrimaryServer`
    - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/unlink`
    - Reference: https://developer.dnsimple.com/v2/secondary-dns/#unlinkPrimaryServer

11. **Secondary DNS - Create Secondary Zone**
    - Method: `createSecondaryZone`
    - HTTP: `POST /{account}/secondary_dns/zones`
    - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createSecondaryZone

### Elixir (`dnsimple-elixir`)

**Repository:** https://github.com/dnsimple/dnsimple-elixir

**Missing Endpoints (10):**

#### Priority (from ticket #174)

1. **Restore Domain**
   - Method: `restore_domain`
   - HTTP: `POST /{account}/registrar/domains/{domain}/restores`
   - Reference: https://developer.dnsimple.com/v2/registrar/#restoreDomain

2. **Get Domain Restore**
   - Method: `get_domain_restore`
   - HTTP: `GET /{account}/registrar/domains/{domain}/restores/{restore}`
   - Reference: https://developer.dnsimple.com/v2/registrar/#getDomainRestore

#### Additional Missing Endpoints

3. **Batch Change Zone Records**
   - Method: `batch_change_zone_records`
   - HTTP: `POST /{account}/zones/{zone}/batch`
   - Reference: https://developer.dnsimple.com/v2/zones/records/#batchChangeZoneRecords

4. **DNS Analytics Query**
   - Method: `query_dns_analytics`
   - HTTP: `GET /{account}/dns_analytics`
   - Reference: https://developer.dnsimple.com/v2/dns-analytics/#queryDnsAnalytics

5. **Secondary DNS - List Primary Servers**
   - Method: `list_primary_servers`
   - HTTP: `GET /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#listPrimaryServers

6. **Secondary DNS - Create Primary Server**
   - Method: `create_primary_server`
   - HTTP: `POST /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createPrimaryServer

7. **Secondary DNS - Get Primary Server**
   - Method: `get_primary_server`
   - HTTP: `GET /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#getPrimaryServer

8. **Secondary DNS - Remove Primary Server**
   - Method: `remove_primary_server`
   - HTTP: `DELETE /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#removePrimaryServer

9. **Secondary DNS - Link Primary Server**
   - Method: `link_primary_server`
   - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/link`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#linkPrimaryServer

10. **Secondary DNS - Unlink Primary Server**
    - Method: `unlink_primary_server`
    - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/unlink`
    - Reference: https://developer.dnsimple.com/v2/secondary-dns/#unlinkPrimaryServer

11. **Secondary DNS - Create Secondary Zone**
    - Method: `create_secondary_zone`
    - HTTP: `POST /{account}/secondary_dns/zones`
    - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createSecondaryZone

### C# (`dnsimple-csharp`)

**Repository:** https://github.com/dnsimple/dnsimple-csharp

**Missing Endpoints (10):**

#### Priority (from ticket #174)

1. **Restore Domain**
   - Method: `RestoreDomain`
   - HTTP: `POST /{account}/registrar/domains/{domain}/restores`
   - Reference: https://developer.dnsimple.com/v2/registrar/#restoreDomain

2. **Get Domain Restore**
   - Method: `GetDomainRestore`
   - HTTP: `GET /{account}/registrar/domains/{domain}/restores/{restore}`
   - Reference: https://developer.dnsimple.com/v2/registrar/#getDomainRestore

#### Additional Missing Endpoints

3. **Batch Change Zone Records**
   - Method: `BatchChangeZoneRecords`
   - HTTP: `POST /{account}/zones/{zone}/batch`
   - Reference: https://developer.dnsimple.com/v2/zones/records/#batchChangeZoneRecords

4. **DNS Analytics Query**
   - Method: `QueryDnsAnalytics`
   - HTTP: `GET /{account}/dns_analytics`
   - Reference: https://developer.dnsimple.com/v2/dns-analytics/#queryDnsAnalytics

5. **Secondary DNS - List Primary Servers**
   - Method: `ListPrimaryServers`
   - HTTP: `GET /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#listPrimaryServers

6. **Secondary DNS - Create Primary Server**
   - Method: `CreatePrimaryServer`
   - HTTP: `POST /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createPrimaryServer

7. **Secondary DNS - Get Primary Server**
   - Method: `GetPrimaryServer`
   - HTTP: `GET /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#getPrimaryServer

8. **Secondary DNS - Remove Primary Server**
   - Method: `RemovePrimaryServer`
   - HTTP: `DELETE /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#removePrimaryServer

9. **Secondary DNS - Link Primary Server**
   - Method: `LinkPrimaryServer`
   - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/link`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#linkPrimaryServer

10. **Secondary DNS - Unlink Primary Server**
    - Method: `UnlinkPrimaryServer`
    - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/unlink`
    - Reference: https://developer.dnsimple.com/v2/secondary-dns/#unlinkPrimaryServer

11. **Secondary DNS - Create Secondary Zone**
    - Method: `CreateSecondaryZone`
    - HTTP: `POST /{account}/secondary_dns/zones`
    - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createSecondaryZone

### Rust (`dnsimple-rust`)

**Repository:** https://github.com/dnsimple/dnsimple-rust

**Missing Endpoints (11):**

#### Priority (from ticket #174)

1. **Restore Domain**
   - Method: `restore_domain`
   - HTTP: `POST /{account}/registrar/domains/{domain}/restores`
   - Reference: https://developer.dnsimple.com/v2/registrar/#restoreDomain

2. **Get Domain Restore**
   - Method: `get_domain_restore`
   - HTTP: `GET /{account}/registrar/domains/{domain}/restores/{restore}`
   - Reference: https://developer.dnsimple.com/v2/registrar/#getDomainRestore

#### Additional Missing Endpoints

3. **Batch Change Zone Records**
   - Method: `batch_change_zone_records`
   - HTTP: `POST /{account}/zones/{zone}/batch`
   - Reference: https://developer.dnsimple.com/v2/zones/records/#batchChangeZoneRecords

4. **DNS Analytics Query**
   - Method: `query_dns_analytics`
   - HTTP: `GET /{account}/dns_analytics`
   - Reference: https://developer.dnsimple.com/v2/dns-analytics/#queryDnsAnalytics

5. **Billing - List Charges**
   - Method: `list_charges`
   - HTTP: `GET /{account}/billing/charges`
   - Reference: https://developer.dnsimple.com/v2/billing/#listCharges

6. **Secondary DNS - List Primary Servers**
   - Method: `list_primary_servers`
   - HTTP: `GET /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#listPrimaryServers

7. **Secondary DNS - Create Primary Server**
   - Method: `create_primary_server`
   - HTTP: `POST /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createPrimaryServer

8. **Secondary DNS - Get Primary Server**
   - Method: `get_primary_server`
   - HTTP: `GET /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#getPrimaryServer

9. **Secondary DNS - Remove Primary Server**
   - Method: `remove_primary_server`
   - HTTP: `DELETE /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#removePrimaryServer

10. **Secondary DNS - Link Primary Server**
    - Method: `link_primary_server`
    - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/link`
    - Reference: https://developer.dnsimple.com/v2/secondary-dns/#linkPrimaryServer

11. **Secondary DNS - Unlink Primary Server**
    - Method: `unlink_primary_server`
    - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/unlink`
    - Reference: https://developer.dnsimple.com/v2/secondary-dns/#unlinkPrimaryServer

12. **Secondary DNS - Create Secondary Zone**
    - Method: `create_secondary_zone`
    - HTTP: `POST /{account}/secondary_dns/zones`
    - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createSecondaryZone

### Ruby (`dnsimple-ruby`)

**Repository:** https://github.com/dnsimple/dnsimple-ruby

**Missing Endpoints (7):**

1. **Secondary DNS - List Primary Servers**
   - Method: `list_primary_servers`
   - HTTP: `GET /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#listPrimaryServers

2. **Secondary DNS - Create Primary Server**
   - Method: `create_primary_server`
   - HTTP: `POST /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createPrimaryServer

3. **Secondary DNS - Get Primary Server**
   - Method: `get_primary_server`
   - HTTP: `GET /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#getPrimaryServer

4. **Secondary DNS - Remove Primary Server**
   - Method: `remove_primary_server`
   - HTTP: `DELETE /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#removePrimaryServer

5. **Secondary DNS - Link Primary Server**
   - Method: `link_primary_server`
   - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/link`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#linkPrimaryServer

6. **Secondary DNS - Unlink Primary Server**
   - Method: `unlink_primary_server`
   - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/unlink`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#unlinkPrimaryServer

7. **Secondary DNS - Create Secondary Zone**
   - Method: `create_secondary_zone`
   - HTTP: `POST /{account}/secondary_dns/zones`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createSecondaryZone

### Go (`dnsimple-go`)

**Repository:** https://github.com/dnsimple/dnsimple-go

**Missing Endpoints (7):**

1. **Secondary DNS - List Primary Servers**
   - Method: `ListPrimaryServers`
   - HTTP: `GET /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#listPrimaryServers

2. **Secondary DNS - Create Primary Server**
   - Method: `CreatePrimaryServer`
   - HTTP: `POST /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createPrimaryServer

3. **Secondary DNS - Get Primary Server**
   - Method: `GetPrimaryServer`
   - HTTP: `GET /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#getPrimaryServer

4. **Secondary DNS - Remove Primary Server**
   - Method: `RemovePrimaryServer`
   - HTTP: `DELETE /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#removePrimaryServer

5. **Secondary DNS - Link Primary Server**
   - Method: `LinkPrimaryServer`
   - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/link`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#linkPrimaryServer

6. **Secondary DNS - Unlink Primary Server**
   - Method: `UnlinkPrimaryServer`
   - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/unlink`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#unlinkPrimaryServer

7. **Secondary DNS - Create Secondary Zone**
   - Method: `CreateSecondaryZone`
   - HTTP: `POST /{account}/secondary_dns/zones`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createSecondaryZone

### Python (`dnsimple-python`)

**Repository:** https://github.com/dnsimple/dnsimple-python

**Missing Endpoints (7):**

1. **Secondary DNS - List Primary Servers**
   - Method: `list_primary_servers`
   - HTTP: `GET /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#listPrimaryServers

2. **Secondary DNS - Create Primary Server**
   - Method: `create_primary_server`
   - HTTP: `POST /{account}/secondary_dns/primaries`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createPrimaryServer

3. **Secondary DNS - Get Primary Server**
   - Method: `get_primary_server`
   - HTTP: `GET /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#getPrimaryServer

4. **Secondary DNS - Remove Primary Server**
   - Method: `remove_primary_server`
   - HTTP: `DELETE /{account}/secondary_dns/primaries/{primaryserver}`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#removePrimaryServer

5. **Secondary DNS - Link Primary Server**
   - Method: `link_primary_server`
   - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/link`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#linkPrimaryServer

6. **Secondary DNS - Unlink Primary Server**
   - Method: `unlink_primary_server`
   - HTTP: `PUT /{account}/secondary_dns/primaries/{primaryserver}/unlink`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#unlinkPrimaryServer

7. **Secondary DNS - Create Secondary Zone**
   - Method: `create_secondary_zone`
   - HTTP: `POST /{account}/secondary_dns/zones`
   - Reference: https://developer.dnsimple.com/v2/secondary-dns/#createSecondaryZone

## Implementation Priority

### Tier 1 - High Priority (from ticket #174)

These endpoints are explicitly mentioned in the tracking ticket as priority items:

| Endpoint                    | Clients Requiring Implementation          |
|-----------------------------|-------------------------------------------|
| Domain Restore (POST + GET) | Node, PHP, Java, Elixir, C#, Rust         |

### Tier 2 - Medium Priority

These endpoints provide significant functionality and should be implemented for feature parity:

| Endpoint                  | Clients Requiring Implementation  |
|---------------------------|-----------------------------------|
| Batch Change Zone Records | Node, PHP, Java, Elixir, C#, Rust |
| DNS Analytics Query       | Node, PHP, Java, Elixir, C#, Rust |

### Tier 3 - Lower Priority

These endpoints are less commonly used but needed for complete API coverage:

| Endpoint                    | Clients Requiring Implementation             |
|-----------------------------|----------------------------------------------|
| Secondary DNS (7 endpoints) | Ruby, Go, Python, PHP, Java, Elixir, C#, Rust |
| Billing (List Charges)      | Rust                                         |
