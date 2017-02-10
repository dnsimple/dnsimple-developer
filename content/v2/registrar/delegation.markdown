---
title: Delegation API | Registrar | DNSimple API v2
excerpt: This page documents the DNSimple domain name servers API v2.
---

# Name servers and delegation API

* TOC
{:toc}

Retrieve and manage delegation for a domain in DNSimple.


## List name servers for a domain {#list}

    GET /:account/registrar/domains/:domain/delegation

List name servers for the domain in the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

List name servers for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/delegation

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/getDomainDelegation/success.http") %>
~~~


## Update name servers for a domain {#update}

    PUT /:account/registrar/domains/:domain/delegation

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Update name servers for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT \
          -d '["ns1.example.com","ns2.example.com"]' \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/delegation

### Input

Name | Type | Description
-----|------|------------
 | `array` | **Required** A list of name server names as strings.

##### Example

~~~json
[
  "ns1.example.com",
  "ns2.example.com"
]
~~~

### Response

Responds with HTTP 200 on success, renders the list of name server names.

~~~json
<%= pretty_print_fixture("/changeDomainDelegation/success.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the delegation fails.


## Delegate to Vanity Name Servers {#delegateToVanity}

<note>
This method required the **vanity name servers** feature, that is [only available for certain plans](https://dnsimple.com/pricing). If the feature is not enabled, you will receive an HTTP 412 response code.
</note>

    PUT /:account/registrar/domains/:domain/delegation/vanity

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Input

Name | Type | Description
-----|------|------------
 | `array` | **Required** A list of name server names as strings.

### Example

Update name servers for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT \
          -d '["ns1.example.com","ns2.example.com"]' \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/delegation/vanity

### Response

Responds with HTTP 200 on success, renders the list of name server names.

~~~json
<%= pretty_print_fixture("/changeDomainDelegationToVanity/success.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the delegation fails.

Responds with HTTP 412 if the feature is not enabled for the account.

## Dedelegate from Vanity Name Servers {#dedelegateFromVanity}

<note>
This method required the **vanity name servers** feature, that is [only available for certain plans](https://dnsimple.com/pricing). If the feature is not enabled, you will receive an HTTP 412 response code.
</note>

    DELETE /:account/registrar/domains/:domain/delegation/vanity

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Update name servers for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/registrar/domains/example.com/delegation/vanity

### Response

Responds with HTTP 204 on success.

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the dedelegation fails.

Responds with HTTP 412 if the feature is not enabled for the account.
