---
title: Collaborators API | Domains | DNSimple API v2 (Beta)
excerpt: This page documents the DNSimple collaborators API v2.
---

# Collaborators API

* TOC
{:toc}

## List collaborators {#list}

    GET /:account/domains/:domain/collaborators

List collaborators for the domain in the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

List all collaborators for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/collaborators

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/listCollaborators/success.http") %>
~~~


## Add a collaborator {#add}

    POST /:account/domains/:domain/collaborators

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Add a collaborator for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/domains/example.com/collaborators

### Input

Name | Type | Description
-----|------|------------
`email` | `string` | **Required**.

##### Example

~~~json
{
  "email": "existing-user@example.com"
}
~~~

### Response

~~~json
<%= pretty_print_fixture("/addCollaborator/success.http") %>
~~~

Responds with HTTP 201 on success.

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Remove a collaborator {#remove}

    DELETE /:account/domains/:domain/collaborators/:collaborator

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id
`:collaborator` | `integer` | The collaborator id

### Example

Remove a collaborator `100` from the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/domains/example.com/collaborators/100

### Response

Responds with HTTP 204 on success.

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.
