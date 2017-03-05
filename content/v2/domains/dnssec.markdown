---
title: DNSSEC API | Domains | DNSimple API v2
excerpt: This page documents the DNSimple DNSSEC API v2.
---

# DNSSEC API

<note>
This article describes a feature in Public Beta.
</note>

### Table of Contents {#toc}

* TOC
{:toc}


## Enable DNSSEC {#enable}

    POST /:account/domains/:domain/dnssec

Enable DNSSEC for the domain in the account. This will sign the zone. If the domain is registered it will also add the DS record to the corresponding registry.

### Example

Enable DNSSEC for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X POST \
          https://api.dnsimple.com/v2/1010/domains/example.com/dnssec

### Response

Responds with HTTP 201.

~~~json
<%= pretty_print_fixture("/enableDnssec/success.http") %>
~~~


## Disable DNSSEC {#disable}

    DELETE /:account/domains/:domain/dnssec

### Example

Disable DNSSEC for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/domains/example.com/dnssec

### Response

Responds with HTTP 204.

~~~json
<%= pretty_print_fixture("/disableDnssec/success.http") %>
~~~


## Get DNSSEC {#get}

    GET /:account/domains/:domain/dnssec

Get the status of DNSSEC, indicating whether it is currently enabled or disabled.

### Example

Get the DNSSEC status for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/dnssec

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/getDnssec/success.http") %>
~~~


## List delegation signer records {#list}

    GET /:account/domains/:domain/ds_records

List delegation signer records for the domain in the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

List all delegation signer records for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/ds_records

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/listDelegationSignerRecords/success.http") %>
~~~

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort delegation signer records by ID
`created_at` | Sort delegation signer records by creation date

The default sorting policy is by ascending `id`.


## Create a delegation signer record {#create}

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
`algorithm` | `string` | **Required**.
`digest` | `string` | **Required**.
`digest_type` | `string` | **Required**.
`keytag` | `string` | **Required**.

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
<%= pretty_print_fixture("/createDelegationSignerRecord/created.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Get a delegation signer record {#get}

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
<%= pretty_print_fixture("/getDelegationSignerRecord/success.http") %>
~~~


## Delete a delegation signer record {#delete}

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
