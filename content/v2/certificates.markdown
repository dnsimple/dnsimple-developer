---
title: Certificates API | DNSimple API v2
excerpt: This page documents the DNSimple certificates API v2.
---

# Certificates API

* TOC
{:toc}


## List certificates {#listCertificates}

List the certificates for a domain.

~~~
GET /:account/domains/:domain/certificates
~~~

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

Get information for an existing certificate.

~~~
GET /:account/domains/:domain/certificates/:certificate
~~~

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

Download an existing PEM-encoded certificate and intermediate certificates.

~~~
GET /:account/domains/:domain/certificates/:certificate/download
~~~

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

Download the PEM-encoded private key for an existing certificate.

~~~
GET /:account/domains/:domain/certificates/:certificate/private_key
~~~

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

