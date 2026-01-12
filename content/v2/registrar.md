---
title: Registrar API | DNSimple API v2
excerpt: This page documents the DNSimple registry/registrar API v2.
---

# Registrar API

* TOC
{:toc}


## Check domain {#checkDomain}

> [!WARNING]
> This API endpoint has stricter limits in place to avoid a high volume of requests. This endpoint should be used only to check a domain's state before issuing a domain registration or a domain transfer. For other use cases, we recommend using other services like [Domainr](https://domainr.com/).

Checks a domain name for availability.

```
GET /:account/registrar/domains/:domain/check
```

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name

### Example

Check the domain `example.com` in the account `1010`:

```shell
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      -X GET \
      https://api.dnsimple.com/v2/1010/registrar/domains/example.com/check
```

### Response

Responds with HTTP 200 on success, returns the domain availability information.

```json
<%= pretty_print_fixture("/api/checkDomain/success.http") %>
```

> [!NOTE]
> If the domain is premium (`premium: true`), please [check the premium price](#getDomainPrices) before to try to [register](#register), [renew](#renew), [transfer](#transfer).

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the domain availability cannot be checked.

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.

## Check domain premium price {#getDomainPremiumPrice}

> [!WARNING]
> This endpoint has been deprecated and removed. Use [getDomainPrices](#getDomainPrices) instead.

## Retrieve domain prices {#getDomainPrices}

Get a domain's price for registration, renewal, and transfer.

<%= render "/v2-preview-endpoint.*" %>

```
GET /:account/registrar/domains/:domain/prices
```

### Parameters

| Name       | Type      | Description     |
| ---------- | --------- | --------------- |
| `:account` | `integer` | The account id  |
| `:domain`  | `string`  | The domain name |

### Examples

Check the registration, renewal, and transfer price for `example.com` domain:

```shell
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      -X GET \
      https://api.dnsimple.com/v2/1010/registrar/domains/example.com/prices
```

### Response

Responds with HTTP 200 on success, returns the domain pricing for registration, renewal, and transfer if the domain is premium.

```json
<%= pretty_print_fixture("/api/getDomainPrices/success.http") %>
```

Responds with HTTP 400, if the domain TLD is not supported.

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the TLD is not supported or the price cannot be checked.

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.

## Register a domain {#registerDomain}

    POST /:account/registrar/domains/:domain/registrations

Register a domain name with DNSimple.

Your account must be active for this command to complete successfully.
You will be automatically charged the registration fee upon successful registration, so please be careful with this command.

> [!NOTE]
> When registering a domain using Solo or Teams subscription, the DNS services
> for the zone will be automatically enabled. This will be charged on your
> following subscription renewal invoices.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name

### Example

Register the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/registrations

### Input

Name | Type | Description
-----|------|------------
`registrant_id` | `integer` | **Required**. The ID of an existing [contact](/v2/contacts/#contact-attributes) in your account.
`whois_privacy` | `bool` | Set to true will attempt to purchase/enable the whois privacy as part of the registration. An extra cost may apply. Default: `false`.
`linked_provider` | `string` | When set to the nickname of a linked provider, registration of the domain will go through that provider. Otherwise, registration of the domain will go through DNSimple.
`auto_renew` | `bool` | Set to true to enable the auto-renewal of the domain. Default: `false`.
`extended_attributes` | `hash` | **Required** for TLDs that require [extended attributes](/v2/tlds/#getTldExtendedAttributes).
`premium_price` | `string` | **Required** as confirmation of the price, only if the domain is premium.

> [!NOTE]
> The `registrant_id` can be fetched via the [contacts endpoint](/v2/contacts/) and will be the registered contact for this domain.

> [!NOTE]
> The `premium_price` can be fetched via the [prices endpoint](#getDomainPrices).

##### Example

```json
{
  "registrant_id": 1
}
```

### Response

Responds with HTTP 201 when registration was processed and completed.

Responds with HTTP 202 when registration was processed but is pending completion.

```json
<%= pretty_print_fixture("/api/registerDomain/success.http") %>
```

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the domain cannot be registrered.

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.

Responds with [HTTP 402](/v2/#payment-required) if the account has outstanding payments.

## Retrieve a Domain Registration {#getDomainRegistration}

Retrieves the details of an existing domain registration.

```
GET /:account/registrar/domains/:domain/registrations/:domain_registration
```

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name
`:domain_registration` | `integer` | The domain registration id

### Example

Get the domain registration with ID `361` in the account `1010` for the domain `example.com`:

```
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/1010/registrar/domains/example.com/registrations/361
```

### Response

Responds with HTTP 200 on success.

```json
<%= pretty_print_fixture("/api/getDomainRegistration/success.http") %>
```

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.

## Transfer a domain {#transferDomain}

    POST /:account/registrar/domains/:domain/transfers

Transfer a domain name from another domain registrar into DNSimple.

Your account must be active for this command to complete successfully.
You will be automatically charged the 1-year transfer fee upon successful transfer, so please be careful with this command.
The transfer may take anywhere from a few minutes up to 7 days.

> [!NOTE]
> When transfering a domain using Solo or Teams subscription, the DNS services
> for the zone will be automatically enabled. This will be charged on your
> following subscription renewal invoices.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name

### Example

Transfer the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/transfers

### Input

Name | Type | Description
-----|------|------------
`registrant_id` | `integer` | **Required**. The ID of an existing [contact](/v2/contacts/#contact-attributes) in your account.
`auth_code` | `string` | **Required** for TLDS that require authorization-based transfer (the vast majority of TLDs).
`whois_privacy` | `bool` | Set to true will attempt to purchase/enable the whois privacy as part of the transfer. An extra cost may apply. Default: `false`.
`auto_renew` | `bool` | Set to true to enable the auto-renewal of the domain. Default: `false`.
`extended_attributes` | `hash` | **Required** for TLDs that require [extended attributes](/v2/tlds/#getTldExtendedAttributes).
`premium_price` | `string` | **Required** as confirmation of the price, only if the domain is premium.

##### Example

```json
{
  "registrant_id": 1,
  "auth_code": "xjfjfjvhc293"
}
```

##### Example with extended attributes

```json
{
  "registrant_id": 1,
  "auth_code": "xjfjfjvhc293",
  "extended_attribute": {
    "us_nexus": "C11",
    "us_purpose": "P3"
  }
}
```

### Response

Responds with HTTP 201 when transfer was processed and completed.

Responds with HTTP 202 when transfer was processed but is pending completion.

```json
<%= pretty_print_fixture("/api/transferDomain/success.http") %>
```

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the domain transfer cannot be initiated.

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.

Responds with [HTTP 402](/v2/#payment-required) if the account has outstanding payments.


## Retrieve a Domain Transfer {#getDomainTransfer}

Retrieves the details of an existing domain transfer.

```
GET /:account/registrar/domains/:domain/transfers/:domain_transfer
```

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name
`:domain_transfer` | `integer` | The domain transfer id

### Example

Get the domain transfer with ID `361` in the account `1010`:

```
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/1010/registrar/domains/example.com/transfers/361
```

### Response

Responds with HTTP 200 on success.

```json
<%= pretty_print_fixture("/api/getDomainTransfer/success.http") %>
```

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.

## Cancel a Domain Transfer {#cancelDomainTransfer}

Cancels an in progress domain transfer.

```
DELETE /:account/registrar/domains/:domain/transfers/:domain_transfer
```

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name
`:domain_transfer` | `integer` | The domain transfer id

### Example

Cancel the in progress domain transfer with ID `361` in the account `1010`:

```
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      -X DELETE \
      https://api.dnsimple.com/v2/1010/registrar/domains/example.com/transfers/361
```

### Response

Responds with HTTP 202 on success.

```json
<%= pretty_print_fixture("/api/cancelDomainTransfer/success.http") %>
```

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the transfer cannot be canceled.

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.

## Renew a domain {#renewDomain}

    POST /:account/registrar/domains/:domain/renewals

Renew a domain name already registered with DNSimple.

Your account must be active for this command to complete successfully.
You will be automatically charged the renewal fee upon successful renewal, so please be careful with this command.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name

### Example

Renew the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/renewals

### Input

Name | Type | Description
-----|------|------------
`period` | `integer` | The number of years. Unless specified it will default to whatever value is set for the TLD.
`premium_price` | `string` | **Required** as confirmation of the price, only if the domain is premium.

##### Example with optional period

```json
{
  "period": 2
}
```

### Response

Responds with HTTP 201 when renewal was processed and completed.

Responds with HTTP 202 when renewal was processed but is pending completion.

```json
<%= pretty_print_fixture("/api/renewDomain/success.http") %>
```

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the domain cannot be renewed.

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.

Responds with [HTTP 402](/v2/#payment-required) if the account has outstanding payments.

## Retrieve a Domain Renewal {#getDomainRenewal}

Retrieves the details of an existing domain renewal.

```
GET /:account/registrar/domains/:domain/renewals/:domain_renewal
```

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name
`:domain_renewal` | `integer` | The domain renewal id

### Example

Get the domain renewal with ID `1` in the account `1010` for the domain `example.com`:

```
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/1010/registrar/domains/example.com/renewals/1
```

### Response

Responds with HTTP 200 on success.

```json
<%= pretty_print_fixture("/api/getDomainRenewal/success.http") %>
```

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.

## Restore a domain {#restoreDomain}

    POST /:account/registrar/domains/:domain/restores

Restore a eligable expired domain name where your registration with DNSimple lapsed.

Your account must be active for this command to complete successfully.
You will be automatically charged the restore fee upon successful restore, so please be careful with this command.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name

### Example

Restore the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/restores

### Input

Name | Type | Description
-----|------|------------
`premium_price` | `string` | **Required** as confirmation of the price, only if the domain is premium.

##### Example with optional premium_price

```json
{
  "premium_price": '109.00'
}
```

### Response

Responds with HTTP 201 when restore was processed and completed.

Responds with HTTP 202 when restore was processed but is pending completion.

```json
<%= pretty_print_fixture("/api/restoreDomain/success.http") %>
```

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the domain cannot be restored.

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.

Responds with [HTTP 402](/v2/#payment-required) if the account has outstanding payments.

## Retrieve a Domain Restore {#getDomainRestore}

Retrieves the details of an existing domain restore.

```
GET /:account/registrar/domains/:domain/restores/:domain_restore
```

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name
`:domain_restore` | `integer` | The domain restore id

### Example

Get the domain restore with ID `1` in the account `1010` for the domain `example.com`:

```
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/1010/registrar/domains/example.com/restores/1
```

### Response

Responds with HTTP 200 on success.

```json
<%= pretty_print_fixture("/api/getDomainRestore/success.http") %>
```

### Errors

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.

## Authorize a domain transfer out {#authorizeDomainTransferOut}

    POST /:account/registrar/domains/:domain/authorize_transfer_out

Prepare a domain for transferring out. This will unlock a domain and send the authorization code to the domain's administrative contact.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string` | The domain name

### Example

Transfer out the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/authorize_transfer_out

### Response

Responds with HTTP 204 on success.

### Errors

Responds with [HTTP 400](/v2/#bad-request) if the transfer out cannot be authorized.

Responds with [HTTP 401](/v2/#unauthorized) in case of authentication issues.
