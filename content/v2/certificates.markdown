---
title: Certificates API | DNSimple API v2
excerpt: This page documents the DNSimple certificates API v2.
---

# Certificates API

* TOC
{:toc}


## List certificates {#listCertificates}

    GET /:account/domains/:domain/certificates

List the certificates for a domain in the account.

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


## Get a certificate {#getCertificate}

    GET /:account/domains/:domain/certificates/:certificate

Get the details of a certificate.

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
<%= pretty_print_fixture("/downloadCertificate/success.http") %>
~~~


## Get a certificate private key {#getCertificatePrivateKey}

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
<%= pretty_print_fixture("/getCertificatePrivateKey/success.http") %>
~~~


## Let's Encrypt: Purchase a certificate {#purchaseLetsencryptCertificate}

<%= render "v2-preview" %>

    POST /:account/domains/:domain/certificates/letsencrypt

Purchase a [Let's Encrypt](https://dnsimple.com/letsencrypt) certificate with DNSimple.

The certificate is **free of charge**, but some features of the certificate may require higher tier plans.

<note>
The domain must be [delegated](https://support.dnsimple.com/articles/pointing-domain-to-dnsimple/) to DNSimple.
</note>

### Certificate name

The default certificate name is `www` and covers both the root domain (e.g. `example.com`) and the `www` subdomain (e.g. `www.example.com`).

You can choose a **custom name** (like `api`), which is valid only for `https://api.example.com`.
Custom names require a subscription to a Professional or Business plan.

### Alternate names

A certificate can be purchased for multiple subdomains. We call them _alternate names_ or [Subject Alternative Name (SAN)](https://support.dnsimple.com/articles/what-is-ssl-san/).

By default a certificate does not have alternate names.

You can purchase a single certificate for both `https://docs.example.com` and `https://status.example.com`, alongside  `https://example.com`.

Alternate names require a subscription to a Professional or Business plan.

### Auto renewal

By default a certificate is not auto-renewed when it expires.

Certificates with auto-renewal disabled may be [renewed manually](#purchaseRenewalLetsencryptCertificate).

You may also **purchase the certificate once** and select the auto-renewal option. With auto-renewal enabled, our system automatically renews a certificate before it expires. Notification for renewed certificates are sent via email and a webhook is fired when a new certificate is available. You will still have to install the renewed certificate.

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

<callout>
The `contact_id` can be fetched via the [contacts endpoint](/v2/contacts).
</callout>

### Response

~~~json
<%= pretty_print_fixture("/purchaseLetsencryptCertificate/success.http") %>
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

Issue a Let's Encrypt certificate with ID `200`, for `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X POST \
          https://api.dnsimple.com/v2/1010/domains/example.com/certificates/letsencrypt/200/issue

### Response

~~~json
<%= pretty_print_fixture("/issueLetsencryptCertificate/success.http") %>
~~~

<callout>
The certificate will be in state `requesting`, and it can't be [downloaded](#download) until issued by Let's Encrypt.
You can **subscribe to a [webhook](/v2/webhooks)** to receive a notification when the certificate is issued.
</callout>


## Let's Encrypt: Renew a certificate {#purchaseRenewalLetsencryptCertificate}

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

<callout>
The `:certificate_renewal` ID is the one returned by the [renewal](#purchaseRenewalLetsencryptCertificate).
</callout>

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

<callout>
The certificate will be in state `requesting`, and it can't be [downloaded](#downloadCertificate) until issued by Let's Encrypt.
You can subscribe to a [webhook](/v2/webhooks) to receive a notification once the certificate is issued.
</callout>
