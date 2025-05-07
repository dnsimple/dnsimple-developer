---
title: Domains API | DNSimple API v2
excerpt: This page documents the DNSimple domains API v2.
---

# Domains API

* TOC
{:toc}


## Domain attributes {#domain-attributes}

Please refer to the definition of the `Domain` data type in [our OpenAPI documentation](/v2/openapi.yml).


## List domains {#listDomains}

Lists the domains in the account.

~~~
GET /:account/domains
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account ID

### Filters

Name | Description
-----|------------
`:name_like` | Only include domains containing given string
`:registrant_id` | Only include domains containing given registrant ID

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort domains by ID
`name` | Sort domains by name (alphabetical order)
`expiration` | Sort domains by expiration date

The default sorting policy is by ascending `name`.

### Examples

List all domains in the account `1385`:

~~~shell
curl  -H 'Authorization: Bearer <token>' \
        -H 'Accept: application/json' \
        https://api.dnsimple.com/v2/1385/domains
~~~

List all domains in the account `1385` that have name matching `"example"`:

~~~shell
curl  -H 'Authorization: Bearer <token>' \
        -H 'Accept: application/json' \
        https://api.dnsimple.com/v2/1385/domains?name_like=example
~~~

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/api/listDomains/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.

## Create a domain {#createDomain}

Adds a domain to the account.

<note>
When creating a domain using a Solo or Teams subscription, the DNS services for the zone will be automatically enabled. This will be charged on your subsequent subscription renewal invoices.
</note>

~~~
POST /:account/domains
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

Create a domain in the account `1385`:

~~~
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      -H 'Content-Type: application/json' \
      -X POST \
      -d '<json>' \
      https://api.dnsimple.com/v2/1385/domains
~~~

### Input

Name | Type | Description
-----|------|------------
`name` | `string` | **Required**.

##### Example

~~~json
{
  "name": "example-beta.com"
}
~~~

### Response

Responds with HTTP 201 on success, renders the domain.

~~~json
<%= pretty_print_fixture("/api/createDomain/created.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2#bad-request) if the registration attempt is invalid.

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.

Responds with [HTTP 402](/v2#payment-required) if the account has outstanding payments.

Responds with **HTTP 406** if domain ownership must be verified prior to adding the zone to your account. To verify ownership, delegate the domain to the verification name servers displayed in the error message. You will receive an email when the domain ownership is verified. Verifications expire after 48 hours.

## Retrieve a domain {#getDomain}

Retrieves the details of an existing domain.

~~~
GET /:account/domains/:domain
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account ID
`:domain` | `string`, `integer` | The domain name or ID

### Example

Get the domain with ID `181984` in the account `1385`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1385/domains/181984

Get the domain `example-alpha.com` in the account `1385`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1385/domains/example-alpha.com

### Response

Responds with HTTP 200, renders the domain.

~~~json
<%= pretty_print_fixture("/api/getDomain/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.


## Delete a domain {#deleteDomain}

Permanently deletes a domain from the account. It cannot be undone.

~~~
DELETE /:account/domains/:domain
~~~

For domains registered with DNSimple, this *will not delete the domain from the registry* or perform a refund.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Delete the domain with ID `1` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/domains/1

Delete the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/domains/example.com

### Response

Responds with HTTP 204 on success.

### Errors

Responds with [HTTP 400](/v2#bad-request) if the domain cannot be deleted.

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.
