---
title: Certificates API | DNSimple API v2
excerpt: This page documents the DNSimple certificates API v2.
---

# Certificates API

* TOC
{:toc}


## List certificates {#list}

    GET /:account/domains/:domain/certificates

List certificates for the domain in the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

List all certificates for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/certificates

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/listCertificates/success.http") %>
~~~

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort by ID
`common_name` | Sort by common name
`expires_on` | Sort by expiration date

The default sorting policy is by descending `id`.


## Get a certificate {#get}

    GET /:account/domains/:domain/certificates/:certificate

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:certificate` | `integer` | The certificate id

### Example

Get the certificate with the ID `1` in the domain `example.com`, in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/certificates/1

### Response

Responds with HTTP 200, renders the certificate.

~~~json
<%= pretty_print_fixture("/getCertificate/success.http") %>
~~~


## Download a certificate {#download}

    GET /:account/domains/:domain/certificates/:certificate/download

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:certificate` | `integer` | The certificate id

### Example

Download the certificate with the ID `1` in the domain `example.com`, in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/certificates/1/download

### Response

Responds with HTTP 200, renders the certificates.

~~~json
<%= pretty_print_fixture("/downloadCertificate/success.http") %>
~~~


## Get a certificate private key {#get-private-key}

    GET /:account/domains/:domain/certificates/:certificate/private_key

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:certificate` | `integer` | The certificate id

### Example

Download the certificate with the ID `1` in the domain `example.com`, in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/certificates/1/private_key

### Response

Responds with HTTP 200, renders the certificate private key.

~~~json
<%= pretty_print_fixture("/getCertificatePrivateKey/success.http") %>
~~~

## Purchase a Let's Encrypt certificate {#letsencrypt-purchase}

    POST /:account/domains/:domain/certificates/letsencrypt

Purchase a [Let's Encrypt](https://dnsimple.com/letsencrypt) certificate with DNSimple.

<note>
Please note that the domain must be [delegated](https://support.dnsimple.com/articles/pointing-domain-to-dnsimple/) to DNSimple.
</note>

The certificate is **free of charge**, but some features of the certificate may require to be subscribed to an higher plan.

### Certificate name

The default certificate name is `www`, which is valid for the naked domain as well.
The name of the certificate will be `www.example.com`, which is valid both for `https://example.com` and `https://www.example.com`.

You can choose a **custom name** (like `api`), which is valid only for `https://api.example.com`.
Custom name requires a subscription to Professional or a Business plan.

### Alternate names

A certificate can be purchased for multiple subdomains.
We call them _alternate names_ or [Subject Alternative Name (SAN)](https://support.dnsimple.com/articles/what-is-ssl-san/).

By default a certificate doesn't have alternate names.

You can purchase a single certificate for both `https://docs.example.com` and `https://status.example.com`, alongside with `https://example.com`.
Alternate names require a subscription to Professional or a Business plan.

### Auto renewal

By default a certificate isn't auto-renewed when in expires.

If that is your case, you must [manually renew](#letsencrypt-purchase-renewal) the certificate.

Otherwise you can **purchase once** and let the system to renew it automatically.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Purchase a Let's Encrypt certificate for `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/domains/example.com/certificates/letsencrypt


### Input

Name | Type | Description
-----|------|------------
`contact_id` | `integer` | **Required**. The ID of an existing contact in your account.
`auto_renew` | `bool` | Set to true to enable the auto-renewal of the certificate. Default: `false`.
`name` | `string` | The certificate name. Default: `"www"`.
`alternate_names` | `array<string>` | The certificate _alternate names_. Default: `[]`. Example: `["docs.example.com", "status.example.com"]`

<note>
The `contact_id` can be fetched via the [contacts endpoint](/v2/contacts) and will be the contact for this certificate.
</note>

### Response

~~~json
<%= pretty_print_fixture("/purchaseLetsencryptCertificate/success.http") %>
~~~

## Issue a Let's Encrypt certificate {#letsencrypt-issue}

    POST /:account/domains/:domain/certificates/letsencrypt/:certificate/issue

Issue a [Let's Encrypt](https://dnsimple.com/letsencrypt) certificate [purchased](#letsencrypt-purchase) with DNSimple.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:certificate` | `integer` | The certificate id

### Example

Issue a Let's Encrypt certificate with ID `200`, for `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X POST \
          https://api.dnsimple.com/v2/1010/domains/example.com/certificates/letsencrypt/200/issue

### Response

~~~json
<%= pretty_print_fixture("/issueLetsencryptCertificate/success.http") %>
~~~

<note>
The certificate will be in state `requesting`, and it can't be [downloaded](#download) until issued by Let's Encrypt.
You can **subscribe to a [webhook](/v2/webhooks)** to receive a notification once the certificate will be issued.
</note>

## Renew a Let's Encrypt certificate {#letsencrypt-purchase-renewal}

    POST /:account/domains/:domain/certificates/letsencrypt/:certificate/renewals

Renew a [Let's Encrypt](https://dnsimple.com/letsencrypt) certificate [purchased](#letsencrypt-purchase) with DNSimple.

<note>
You must renew a certificate **only** if it does **NOT** uses the **auto renewal** feature.
</note>

You can always enable or disable _auto renewal_ when renewing a certificate.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:certificate` | `integer` | The certificate id

### Example

Renew a Let's Encrypt certificate with ID `200` for `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/domains/example.com/certificates/letsencrypt/200/renewals


### Input

Name | Type | Description
-----|------|------------
`auto_renew` | `bool` | Set to true to enable the auto-renewal of the certificate. Default: `false`.

### Response

~~~json
<%= pretty_print_fixture("/purchaseRenewalLetsencryptCertificate/success.http") %>
~~~

## Issue a Let's Encrypt certificate renewal {#letsencrypt-issue-renewal}

    POST /:account/domains/:domain/certificates/letsencrypt/:certificate/renewals/:certificate_renewal/issue

Issue a [Let's Encrypt](https://dnsimple.com/letsencrypt) certificate [renewed](#letsencrypt-purchase-renewal) with DNSimple.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:certificate` | `integer` | The certificate id
`:certificate_renewal` | `integer` | The certificate renewal id

<note>
The `:certificate_renewal` ID is the one returned by the **[renewal](#letsencrypt-purchase-renewal)**.
</note>

### Example

Issue a Let's Encrypt certificate renewal with ID `999`, for the certificate `200`, for `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X POST \
          https://api.dnsimple.com/v2/1010/domains/example.com/certificates/letsencrypt/200/renewals/999/issue

### Response

~~~json
<%= pretty_print_fixture("/issueRenewalLetsencryptCertificate/success.http") %>
~~~

<note>
The certificate will be in state `requesting`, and it can't be [downloaded](#download) until issued by Let's Encrypt.
You can **subscribe to a [webhook](/v2/webhooks)** to receive a notification once the certificate will be issued.
</note>
