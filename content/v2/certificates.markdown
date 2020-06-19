---
title: Certificates API | DNSimple API v2
excerpt: This page documents the DNSimple certificates API v2.
---

# Certificates API

* TOC
{:toc}


## Certificate attributes {#certificate-attributes}

Please refer to the definition of the `Certificate` data type in [our OpenAPI documentation](/v2/openapi.yml).


## List certificates {#listCertificates}

    GET /:account/domains/:domain/certificates

List the certificates for a domain in the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

List all certificates for the domain `dnsimple.us` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/dnsimple.us/certificates

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/api/listCertificates/success.http") %>
~~~

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort by ID
`common_name` | Sort by common name
`expiration` | Sort by expiration date

The default sorting policy is by descending `id`.


## Retrieve a certificate {#getCertificate}

    GET /:account/domains/:domain/certificates/:certificate

Get the details of a certificate.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:certificate` | `integer` | The certificate id

### Example

Get the certificate with the ID `101967` in the domain `bingo.pizza`, in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/bingo.pizza/certificates/101967

### Response

Responds with HTTP 200, renders the certificate.

~~~json
<%= pretty_print_fixture("/api/getCertificate/success.http") %>
~~~


## Download a certificate {#downloadCertificate}

    GET /:account/domains/:domain/certificates/:certificate/download

Get the PEM-encoded certificate, along with the root certificate and intermediate chain.

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
<%= pretty_print_fixture("/api/downloadCertificate/success.http") %>
~~~


## Retrieve a certificate private key {#getCertificatePrivateKey}

    GET /:account/domains/:domain/certificates/:certificate/private_key

Get the PEM-encoded certificate private key.

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
<%= pretty_print_fixture("/api/getCertificatePrivateKey/success.http") %>
~~~


## Let's Encrypt: Order a certificate {#purchaseLetsencryptCertificate}

<%= render "v2-preview" %>

    POST /:account/domains/:domain/certificates/letsencrypt

Purchase a [Let's Encrypt](https://dnsimple.com/letsencrypt) certificate with DNSimple.

The certificate itself is **free**, but some features of the certificate may require higher tier plans.

<note>
The domain must be [delegated](https://support.dnsimple.com/articles/pointing-domain-to-dnsimple/) to DNSimple.
</note>

### Certificate name

The default certificate name is `www` and covers both the root domain (e.g. `example.com`) and the `www` subdomain (e.g. `www.example.com`).

You can choose a **custom name** (like `api`), which is valid only for `https://api.example.com`.
Custom names require a subscription to a Professional or Business plan.

### Alternate names

A certificate can be purchased for multiple subdomains. We call them _alternate names_ or [Subject Alternative Name (SAN)](https://support.dnsimple.com/articles/what-is-ssl-san/).

By default, a certificate doesn't have alternate names.

You can purchase a single certificate for both `https://docs.example.com` and `https://status.example.com`, alongside  `https://example.com`.

Alternate names require a subscription to a Professional or Business plan.

### Wildcard certificates

To request a wildcard certificate that's valid for an unlimited number of names that belong to a single subdomain level, use `*` (e.g. `*.example.com`).

<info>
Let's Encrypt wildcard certificates is a feature that is only available to the following [new plans](https://support.dnsimple.com/articles/new-plans/#newer-plans-some): Professional or Business.
If the feature is not enabled, you will receive an HTTP 412 response code.
</info>

### Auto renewal

By default, a certificate isn't auto-renewed when it expires.

Certificates with auto-renewal disabled may be [renewed manually](#purchaseRenewalLetsencryptCertificate).

You may also **purchase the certificate once** and select the auto-renewal option. With auto-renewal enabled, our system automatically renews a certificate before it expires. Notifications for renewed certificates are sent via email, and a webhook is fired when a new certificate is available. You'll still have to install the renewed certificate.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Purchase a Let's Encrypt certificate for `bingo.pizza` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/domains/bingo.pizza/certificates/letsencrypt


### Input

Name | Type | Description
-----|------|------------
`contact_id` | `integer` | **Required**. The ID of an existing contact in your account.
`auto_renew` | `bool` | Set to true to enable the auto-renewal of the certificate. Default: `false`.
`name` | `string` | The certificate name. Default: `"www"`.
`alternate_names` | `array<string>` | The certificate _alternate names_. Default: `[]`. Example: `["docs.example.com", "status.example.com"]`

<info>
The `contact_id` can be fetched via the [contacts endpoint](/v2/contacts).
</info>

### Response

~~~json
<%= pretty_print_fixture("/api/purchaseLetsencryptCertificate/success.http") %>
~~~


## Let's Encrypt: Issue a certificate {#issueLetsencryptCertificate}

<%= render "v2-preview" %>

    POST /:account/domains/:domain/certificates/letsencrypt/:certificate/issue

Issue a [Let's Encrypt](https://dnsimple.com/letsencrypt) certificate [purchased](#purchaseLetsencryptCertificate) with DNSimple.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:certificate` | `integer` | The certificate id

### Example

Issue a Let's Encrypt certificate with ID `101967`, for `bingo.pizza` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X POST \
          https://api.dnsimple.com/v2/1010/domains/bingo.pizza/certificates/letsencrypt/101967/issue

### Response

~~~json
<%= pretty_print_fixture("/api/issueLetsencryptCertificate/success.http") %>
~~~

<tip>
The certificate will be in state `requesting`, and it can't be [downloaded](#download) until issued by Let's Encrypt.
You can **subscribe to a [webhook](/v2/webhooks)** to receive a notification when the certificate is issued.
</tip>


## Let's Encrypt: Order a certificate renewal {#purchaseRenewalLetsencryptCertificate}

<%= render "v2-preview" %>

    POST /:account/domains/:domain/certificates/letsencrypt/:certificate/renewals

Renew a [Let's Encrypt](https://dnsimple.com/letsencrypt) certificate [purchased](#purchaseLetsencryptCertificate) with DNSimple.

<note>
You must renew a certificate **only** if it does **NOT** use the **auto renewal** feature.
</note>

You can always enable or disable _auto renewal_ when renewing a certificate.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:certificate` | `integer` | The certificate id

### Example

Renew a Let's Encrypt certificate with ID `101967` for `bingo.pizza` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/domains/bingo.pizza/certificates/letsencrypt/101967/renewals


### Input

Name | Type | Description
-----|------|------------
`auto_renew` | `bool` | Set to true to enable the auto-renewal of the certificate. Default: `false`.

### Response

~~~json
<%= pretty_print_fixture("/api/purchaseRenewalLetsencryptCertificate/success.http") %>
~~~


## Let's Encrypt: Issue a certificate renewal {#issueRenewalLetsencryptCertificate}

<%= render "v2-preview" %>

    POST /:account/domains/:domain/certificates/letsencrypt/:certificate/renewals/:certificate_renewal/issue

Issue a [Let's Encrypt](https://dnsimple.com/letsencrypt) certificate [renewed](#purchaseRenewalLetsencryptCertificate) with DNSimple.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:certificate` | `integer` | The certificate id
`:certificate_renewal` | `integer` | The certificate renewal id

<info>
The `:certificate_renewal` ID is the one returned by the [renewal](#purchaseRenewalLetsencryptCertificate).
</info>

### Example

Issue a Let's Encrypt certificate renewal with ID `65082`, for the certificate `101967`, for `bingo.pizza` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X POST \
          https://api.dnsimple.com/v2/1010/domains/example.com/certificates/letsencrypt/101967/renewals/65082/issue

### Response

~~~json
<%= pretty_print_fixture("/api/issueRenewalLetsencryptCertificate/success.http") %>
~~~

<tip>
The certificate will be in state `requesting`, and it can't be [downloaded](#downloadCertificate) until issued by Let's Encrypt.
You can subscribe to a [webhook](/v2/webhooks) to be notified once the certificate is issued.
</tip>
