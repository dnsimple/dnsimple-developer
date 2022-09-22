---
title: Vanity Name Servers API | DNSimple API v2
excerpt: This page documents the DNSimple vanity name servers API v2.
---

# Vanity Name Servers API

* TOC
{:toc}


<info>
The vanity name servers is a feature that is only available to the following [new plans](https://support.dnsimple.com/articles/new-plans/#newer-plans-some): Business.
If the feature is not enabled, you will receive an HTTP 412 response code.
</info>


## Enable vanity name servers {#enableVanityNameServers}

    PUT /:account/vanity/:domain

Enable Vanity Name Servers for the domain. This method sets up the appropriate A and AAAA records for the domain to provide vanity name servers, but it does not change the delegation for the domain. To change the delegation for domains to vanity name servers use the endpoints to [Delegate to Vanity Name Servers](/v2/registrar/delegation/#delegateToVanity) or [Dedelegate from Vanity Name Servers](/v2/registrar/delegation/#dedelegateFromVanity).

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Enable Vanity Name Servers for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X PUT \
          https://api.dnsimple.com/v2/1010/vanity/example.com

### Response

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/api/enableVanityNameServers/success.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2#bad-request) if vanity name servers cannot be enabled.

Responds with [HTTP 401](/v2#unauthorized) in case of case of authentication issues.

Responds with [HTTP 402](/v2#payment-required) if the account has outstanding payments.

Responds with [HTTP 412](/v2#precondition-failed) if the account doesn't have access to the vanity name server feature.


## Disable vanity name servers {#disableVanityNameServers}

    DELETE /:account/vanity/:domain

Disable Vanity Name Servers for the domain. This method removes the A and AAAA records required for the domain to provide vanity name servers, but it does not change the delegation for the domain. To change the delegation for domains to vanity name servers use the endpoints to [Delegate to Vanity Name Servers](/v2/registrar/delegation/#delegateToVanity) or [Dedelegate from Vanity Name Servers](/v2/registrar/delegation/#dedelegateFromVanity).


### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Enable Vanity Name Servers for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/vanity/example.com

### Response

Responds with HTTP 204 on success.

### Errors

Responds with [HTTP 400](/v2#bad-request) if vanity name servers cannot be disabled.

Responds with [HTTP 401](/v2#unauthorized) in case of case of authentication issues.

Responds with [HTTP 402](/v2#payment-required) if the account has outstanding payments.

Responds with [HTTP 412](/v2#precondition-failed) if the account doesn't have access to the vanity name server feature.