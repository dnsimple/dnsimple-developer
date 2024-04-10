---
title: Domain transfer lock API | Registrar | DNSimple API v2
excerpt: This page documents the DNSimple domain transfer lock API v2.
---

# Domain transfer lock API

* TOC
{:toc}

## Enable domain transfer lock {#enableDomainTransferLock}

<%= render "v2-beta-endpoint" %>

Enables the transfer lock for the domain.

~~~
POST /:account/registrar/domains/:domain/transfer_lock
~~~

### Parameters

| Name       | Type                | Description           |
| ---------- | ------------------- | --------------------- |
| `:account` | `integer`           | The account id        |
| `:domain`  | `string`, `integer` | The domain name or id |

### Example

Enable the transfer lock for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/transfer_lock

### Response

Responds with HTTP 201 on success.

~~~json
<%= pretty_print_fixture("/api/enableDomainTransferLock/success.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2#bad-request) if the domain transfer lock cannot be enabled for the domain.

Responds with [HTTP 401](/v2#unauthorized) in case of case of authentication issues.

Responds with [HTTP 404](/v2#not-found) if the domain does not exist.


## Disable domain transfer lock {#disableDomainTransferLock}

<%= render "v2-beta-endpoint" %>

Disables the transfer lock for the domain.

~~~
DELETE /:account/registrar/domains/:domain/transfer_lock
~~~

### Parameters

| Name       | Type                | Description           |
| ---------- | ------------------- | --------------------- |
| `:account` | `integer`           | The account id        |
| `:domain`  | `string`, `integer` | The domain name or id |

### Example

Disable the transfer lock for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/transfer_lock

### Response

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/disableDomainTransferLock/success.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2#bad-request) if the domain transfer lock cannot be disabled for the domain.

Responds with [HTTP 401](/v2#unauthorized) in case of case of authentication issues.

Responds with [HTTP 404](/v2#not-found) if the domain does not exist.


## Retrieve domain transfer lock status {#getDomainTransferLock}

~~~
GET /:account/registrar/domains/:domain/transfer_lock
~~~

Get the status of the domain transfer lock, indicating whether it is currently enabled or disabled.

### Parameters

| Name       | Type                | Description           |
| ---------- | ------------------- | --------------------- |
| `:account` | `integer`           | The account id        |
| `:domain`  | `string`, `integer` | The domain name or id |

### Example

Get the domain transfer lock status for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/transfer_lock

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/api/getDomainTransferLock/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2#unauthorized) in case of case of authentication issues.

Responds with [HTTP 404](/v2#not-found) if the domain does not exist.
