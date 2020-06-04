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
`expires_at` | Sort domains by expiration date

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


## Create a domain {#createDomain}

Adds a domain to the account.

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

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


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


## Delete a domain {#deleteDomain}

Permanently deletes a domain from the account. It cannot be undone.

~~~
DELETE /:account/domains/:domain
~~~

For domains which are registered with DNSimple, this *will not delete the domain from the registry*, nor perform a refund.

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
