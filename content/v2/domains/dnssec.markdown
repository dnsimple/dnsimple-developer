---
title: DNSSEC API | Domains | DNSimple API v2
excerpt: This page documents the DNSimple DNSSEC API v2.
---

# DNSSEC API

<%= render "v2-public-beta-feature" %>

### Table of Contents {#toc}

* TOC
{:toc}

## Enable DNSSEC {#enableDomainDnssec}

    POST /:account/domains/:domain/dnssec

Enable DNSSEC for the domain in the account. This will start signing the zone. When the signed zone is served by all name servers, it will add the DS record to the corresponding registry if the domain is registered via DNSimple. For hosted domains, you will need to add the DS record at the domain's registrar manually.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Enable DNSSEC for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X POST \
          https://api.dnsimple.com/v2/1010/domains/example.com/dnssec

### Response

Responds with HTTP 201.

~~~json
<%= pretty_print_fixture("/api/enableDnssec/success.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2/#bad-request) if DNSSEC cannot be enabled for the domain.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Disable DNSSEC {#disableDomainDnssec}

    DELETE /:account/domains/:domain/dnssec

Disable DNSSEC for the domain in the account. If the domain is registered, it will remove the DS record from the corresponding registry. If your domain is hosted, you should remove the DS record from the domain's registrar *before* using this endpoint. Failure to remove the DS record within 48 hours of disabling DNSSEC will result in DNSSEC validation failures and will stop your domain from resolving with all DNSSEC-aware resolvers.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Disable DNSSEC for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/domains/example.com/dnssec

### Response

Responds with HTTP 204 (No content). Or HTTP 428 if DNSSEC is not currently enabled.

### Errors

Responds with [HTTP 400](/v2/#bad-request) if DNSSEC cannot be disabled for the domain.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Retrieve DNSSEC status {#getDomainDnssec}

    GET /:account/domains/:domain/dnssec

Get the status of DNSSEC, indicating whether it is currently enabled or disabled.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Get the DNSSEC status for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/dnssec

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/api/getDnssec/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## List delegation signer records {#listDomainDelegationSignerRecords}

    GET /:account/domains/:domain/ds_records

List delegation signer records for the domain in the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort delegation signer records by ID
`created_at` | Sort delegation signer records by creation date

The default sorting policy is by ascending `id`.

### Example

List all delegation signer records for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/ds_records

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/api/listDelegationSignerRecords/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Create a delegation signer record {#createDomainDelegationSignerRecord}

You only need to create a delegation signer record manually if your domain is registered with DNSimple but hosted with another DNS provider that is signing your zone. To enable DNSSEC on a domain that is hosted with DNSimple, use the DNSSEC enable endpoint.

    POST /:account/domains/:domain/ds_records

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Create a delegation signer record under the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/domains/example.com/ds_records

### Input

Name | Type | Description
-----|------|------------
`algorithm` | `string` | **Required**  DNSSEC algorithms defined in http://www.iana.org/assignments/dns-sec-alg-numbers/dns-sec-alg-numbers.xhtml - pass the Number value as a string (i.e. "8").
`digest` | `string` | **Required if TLD requires DS data** The hexidecimal representation of the digest of the corresponding DNSKEY record.
`digest_type` | `string` | **Required if TLD requires DS data** DNSSEC digest types defined in http://www.iana.org/assignments/ds-rr-types/ds-rr-types.xhtml - pass the Number value as string (i.e. "2").
`keytag` | `string` | **Required if TLD requires DS data** A keytag that references the corresponding DNSKEY record.
`public_key` | `string` | **Required if TLD requires KEY data** A public key that references the corresponding DNSKEY record.

For additional information, please see [https://tools.ietf.org/html/rfc4034](https://tools.ietf.org/html/rfc4034).

##### Example

~~~json
{
  "algorithm": "13",
  "digest": "684a1f049d7d082b7f98691657da5a65764913df7f065f6f8c36edf62d66ca03",
  "digest_type": "2",
  "keytag": "2371"
}
~~~

### Response

Responds with HTTP 201 on success, renders the delegation signer record.

~~~json
<%= pretty_print_fixture("/api/createDelegationSignerRecord/created.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the delegation signer record cannot be created.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Retrieve a delegation signer record {#getDomainDelegationSignerRecord}

    GET /:account/domains/:domain/ds_records/:ds_record_id

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:ds_record_id` | `integer` | The delegation signer record id

### Example

Get the delegation signer record `1` under the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/ds_records/1

### Response

Responds with HTTP 200 on success, renders the delegation signer record.

~~~json
<%= pretty_print_fixture("/api/getDelegationSignerRecord/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.

## Delete a Delegation Signer record {#deleteDomainDelegationSignerRecord}

    DELETE /:account/domains/:domain/ds_records/:ds_record_id

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:ds_record_id` | `integer` | The delegation signer record id

### Example

Get the delegation signer record `1` under the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/ds_records/1

### Response

Responds with HTTP 204 on success.

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the delegation signer record cannot be deleted.

Responds with [HTTP 401](/v2/#unauthorized) in case of case of authentication issues.