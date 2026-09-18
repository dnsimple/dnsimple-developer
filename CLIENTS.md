# DNSimple API Client Coverage Report

This report tracks endpoint coverage across all DNSimple API clients.

**Date:** 2026-04-09
**Reference spec:** `content/v2/openapi.yml`
**Tracking ticket:** [dnsimple/dnsimple-engineering#174](https://github.com/dnsimple/dnsimple-engineering/issues/174)

## Executive Summary

The `openapi.yml` defines **111 client-facing operations**.

| Client | Missing | Delta vs. prior report |
|--------|:-------:|:----------------------:|
| Node   |    2    | -7 (was 9)             |
| Ruby   |    8    | +1 (was 7)             |
| Go     |    8    | +1 (was 7)             |
| Python |    8    | +1 (was 7)             |
| PHP    |   10    | 0 (was 10)             |
| Java   |   10    | 0 (was 10)             |
| Elixir |   10    | 0 (was 10)             |
| C#     |   10    | 0 (was 10)             |
| Rust   |   10    | -1 (was 11)            |

The deltas account for a newly-surfaced gap: **no client implements `updateZoneNsRecords`** except Node. That endpoint was not tracked in the previous INCONSISTENCIES report.

## Endpoint Coverage Matrix

Legend: ✅ = implemented, ❌ = missing.

| operationId                            | C# | Elixir | Go | Java | Node | PHP | Python | Ruby | Rust |
|----------------------------------------|:--:|:------:|:--:|:----:|:----:|:---:|:------:|:----:|:----:|
| listAccounts                           | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| whoami                                 | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| oauthToken                             | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listCharges                            | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listDomains                            | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| createDomain                           | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getDomain                              | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| deleteDomain                           | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getDomainsResearchStatus               | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getDomainDnssec                        | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| enableDomainDnssec                     | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| disableDomainDnssec                    | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listDomainDelegationSignerRecords      | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| createDomainDelegationSignerRecord     | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getDomainDelegationSignerRecord        | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| deleteDomainDelegationSignerRecord     | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listEmailForwards                      | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| createEmailForward                     | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getEmailForward                        | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| deleteEmailForward                     | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| initiateDomainPush                     | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listPushes                             | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| acceptPush                             | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| rejectPush                             | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listCertificates                       | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getCertificate                         | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| downloadCertificate                    | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getCertificatePrivateKey               | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| purchaseLetsencryptCertificate         | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| issueLetsencryptCertificate            | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| purchaseRenewalLetsencryptCertificate  | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| issueRenewalLetsencryptCertificate     | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listTlds                               | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getTld                                 | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getTldExtendedAttributes               | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| checkDomain                            | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getDomainPrices                        | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| registerDomain                         | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getDomainRegistration                  | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| transferDomain                         | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getDomainTransfer                      | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| cancelDomainTransfer                   | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| renewDomain                            | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getDomainRenewal                       | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| restoreDomain                          | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getDomainRestore                       | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| authorizeDomainTransferOut             | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getDomainDelegation                    | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| changeDomainDelegation                 | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| changeDomainDelegationToVanity         | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| changeDomainDelegationFromVanity       | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getDomainTransferLock                  | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| enableDomainTransferLock               | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| disableDomainTransferLock              | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| enableDomainAutoRenewal                | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| disableDomainAutoRenewal               | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| enableWhoisPrivacy                     | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| disableWhoisPrivacy                    | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listPrimaryServers                     | ❌ | ❌    | ❌ | ❌  | ✅   | ❌ | ❌    | ❌  | ❌  |
| createPrimaryServer                    | ❌ | ❌    | ❌ | ❌  | ✅   | ❌ | ❌    | ❌  | ❌  |
| getPrimaryServer                       | ❌ | ❌    | ❌ | ❌  | ✅   | ❌ | ❌    | ❌  | ❌  |
| removePrimaryServer                    | ❌ | ❌    | ❌ | ❌  | ✅   | ❌ | ❌    | ❌  | ❌  |
| linkPrimaryServer                      | ❌ | ❌    | ❌ | ❌  | ✅   | ❌ | ❌    | ❌  | ❌  |
| unlinkPrimaryServer                    | ❌ | ❌    | ❌ | ❌  | ✅   | ❌ | ❌    | ❌  | ❌  |
| createSecondaryZone                    | ❌ | ❌    | ❌ | ❌  | ✅   | ❌ | ❌    | ❌  | ❌  |
| listZones                              | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getZone                                | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getZoneFile                            | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| checkZoneDistribution                  | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| updateZoneNsRecords                    | ❌ | ❌    | ❌ | ❌  | ✅   | ❌ | ❌    | ❌  | ❌  |
| listZoneRecords                        | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| createZoneRecord                       | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getZoneRecord                          | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| updateZoneRecord                       | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| deleteZoneRecord                       | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| batchChangeZoneRecords                 | ❌ | ❌    | ✅ | ❌  | ❌   | ❌ | ✅    | ✅  | ❌  |
| checkZoneRecordDistribution            | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| activateZoneService                    | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| deactivateZoneService                  | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listContacts                           | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| createContact                          | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getContact                             | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| updateContact                          | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| deleteContact                          | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listRegistrantChanges                  | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| createRegistrantChange                 | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| checkRegistrantChange                  | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getRegistrantChange                    | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| deleteRegistrantChange                 | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listServices                           | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getService                             | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listDomainAppliedServices              | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| applyServiceToDomain                   | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| unapplyServiceFromDomain               | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listTemplates                          | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| createTemplate                         | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getTemplate                            | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| updateTemplate                         | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| deleteTemplate                         | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listTemplateRecords                    | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| createTemplateRecord                   | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getTemplateRecord                      | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| deleteTemplateRecord                   | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| applyTemplateToDomain                  | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| enableVanityNameServers                | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| disableVanityNameServers               | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| listWebhooks                           | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| createWebhook                          | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| getWebhook                             | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| deleteWebhook                          | ✅ | ✅    | ✅ | ✅  | ✅   | ✅ | ✅    | ✅  | ✅  |
| queryDnsAnalytics                      | ❌ | ❌    | ✅ | ❌  | ❌   | ❌ | ✅    | ✅  | ❌  |

## Inconsistencies and Missing Endpoints

Four distinct gaps account for the entire coverage delta. The `updateZoneNsRecords` gap is new in this report; every other gap was already tracked in issue [#174](https://github.com/dnsimple/dnsimple-engineering/issues/174).

### Gap 1 — Batch Change Zone Records (1 operation)

`POST /{account}/zones/{zone}/batch` (`batchChangeZoneRecords`)

Implemented by:

- Go, Python, Ruby

Missing in:

- C#, Elixir, Java, Node, PHP, Rust

### Gap 2 — DNS Analytics Query (1 operation)

`GET /{account}/dns_analytics` (`queryDnsAnalytics`)

Implemented by:

- Go, Python, Ruby

Missing in:

- C#, Elixir, Java, Node, PHP, Rust

### Gap 3 — Update Zone NS Records (1 operation, new)

`PUT /{account}/zones/{zone}/ns_records` (`updateZoneNsRecords`)

Implemented by:

- Node

Missing in:

- C#, Elixir, Go, Java, PHP, Python, Ruby, Rust

### Gap 4 — Secondary DNS (7 operations)

- `GET /{account}/secondary_dns/primaries` (`listPrimaryServers`)
- `POST /{account}/secondary_dns/primaries` (`createPrimaryServer`)
- `GET /{account}/secondary_dns/primaries/{primaryserver}` (`getPrimaryServer`)
- `DELETE /{account}/secondary_dns/primaries/{primaryserver}` (`removePrimaryServer`)
- `PUT /{account}/secondary_dns/primaries/{primaryserver}/link` (`linkPrimaryServer`)
- `PUT /{account}/secondary_dns/primaries/{primaryserver}/unlink` (`unlinkPrimaryServer`)
- `POST /{account}/secondary_dns/zones` (`createSecondaryZone`)

Implemented by:

- Node

Missing in:

- C#, Elixir, Go, Java, PHP, Python, Ruby, Rust

## Per-client gap list

### Node.js (2 missing)

1. `batchChangeZoneRecords`
2. `queryDnsAnalytics`

### Ruby (8 missing)

1. `listPrimaryServers`
2. `createPrimaryServer`
3. `getPrimaryServer`
4. `removePrimaryServer`
5. `linkPrimaryServer`
6. `unlinkPrimaryServer`
7. `createSecondaryZone`
8. `updateZoneNsRecords`

### Go (8 missing)

1. `listPrimaryServers`
2. `createPrimaryServer`
3. `getPrimaryServer`
4. `removePrimaryServer`
5. `linkPrimaryServer`
6. `unlinkPrimaryServer`
7. `createSecondaryZone`
8. `updateZoneNsRecords`

### Python (8 missing)

1. `listPrimaryServers`
2. `createPrimaryServer`
3. `getPrimaryServer`
4. `removePrimaryServer`
5. `linkPrimaryServer`
6. `unlinkPrimaryServer`
7. `createSecondaryZone`
8. `updateZoneNsRecords`

### PHP (10 missing)

1. `batchChangeZoneRecords`
2. `queryDnsAnalytics`
3. `updateZoneNsRecords`
4. `listPrimaryServers`
5. `createPrimaryServer`
6. `getPrimaryServer`
7. `removePrimaryServer`
8. `linkPrimaryServer`
9. `unlinkPrimaryServer`
10. `createSecondaryZone`

### Java (10 missing)

1. `batchChangeZoneRecords`
2. `queryDnsAnalytics`
3. `updateZoneNsRecords`
4. `listPrimaryServers`
5. `createPrimaryServer`
6. `getPrimaryServer`
7. `removePrimaryServer`
8. `linkPrimaryServer`
9. `unlinkPrimaryServer`
10. `createSecondaryZone`

### Elixir (10 missing)

1. `batchChangeZoneRecords`
2. `queryDnsAnalytics`
3. `updateZoneNsRecords`
4. `listPrimaryServers`
5. `createPrimaryServer`
6. `getPrimaryServer`
7. `removePrimaryServer`
8. `linkPrimaryServer`
9. `unlinkPrimaryServer`
10. `createSecondaryZone`

### C# (10 missing)

1. `batchChangeZoneRecords`
2. `queryDnsAnalytics`
3. `updateZoneNsRecords`
4. `listPrimaryServers`
5. `createPrimaryServer`
6. `getPrimaryServer`
7. `removePrimaryServer`
8. `linkPrimaryServer`
9. `unlinkPrimaryServer`
10. `createSecondaryZone`

### Rust (10 missing)

1. `batchChangeZoneRecords`
2. `queryDnsAnalytics`
3. `updateZoneNsRecords`
4. `listPrimaryServers`
5. `createPrimaryServer`
6. `getPrimaryServer`
7. `removePrimaryServer`
8. `linkPrimaryServer`
9. `unlinkPrimaryServer`
10. `createSecondaryZone`

## Notes

- The `updateZoneNsRecords` endpoint (`PUT /{account}/zones/{zone}/ns_records`) is present in `openapi.yml` and implemented in the Node client, but was not tracked in the previous INCONSISTENCIES report. It is the only new gap surfaced by this audit.
- The Node client is now the most complete, having picked up all seven Secondary DNS endpoints and `updateZoneNsRecords`. Its remaining gaps are `batchChangeZoneRecords` and `queryDnsAnalytics`.
