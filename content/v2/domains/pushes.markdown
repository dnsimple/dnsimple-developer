---
title: Push API | Domains | DNSimple API v2
excerpt: This page documents the DNSimple push API v2.
---

# Push API

* TOC
{:toc}


## Initiate a push {#initiateDomainPush}

    POST /:account/domains/:domain/pushes

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Initiate a push from the source account `1010` for the `example.com` domain:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/domains/example.com/pushes

### Input

Name | Type | Description
-----|------|------------
`new_account_email` | `string` | **Required** - The email address of the target DNSimple account.

##### Example

~~~json
{
  "new_account_email": "admin@target-account.test"
}
~~~

### Response

Responds with HTTP 201 on success, renders the push.

~~~json
<%= pretty_print_fixture("/api/initiatePush/success.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.

## List pushes {#listPushes}

    GET /:account/pushes

List pending pushes for the target account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Example

List all the pending pushes for the target account `2020`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/2020/pushes

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/api/listPushes/success.http") %>
~~~


## Accept a push {#acceptPush}

    POST /:account/pushes/:push

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:push` | `integer` | The push id

### Example

Accept a push for the target account `2020`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/2020/pushes/1

### Input

Name | Type | Description
-----|------|------------
`contact_id` | `integer` | **Required** - A contact that belongs to the target DNSimple account. The contact will be used as new registrant for the domain, if the domain is registered with DNSimple.

##### Example

~~~json
{
  "contact_id": "2"
}
~~~

### Response

Responds with HTTP 204 on success.

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Reject a push {#rejectPush}

    DELETE /:account/pushes/:push

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:push` | `integer` | The push id

### Example

Reject a push for the target account `2020`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/2020/pushes/1

### Response

Responds with HTTP 204 on success.

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.
