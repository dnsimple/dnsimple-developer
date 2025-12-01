---
title: Registrant changes API | DNSimple API v2
excerpt: This page documents the DNSimple registrant changes API v2.
---

# Registrant changes API

* TOC
{:toc}

Change the registrant contact for a registered domain.

<info>
The process may require additional steps depending on the TLD and registry requirements, such as extended attributes.
</info>


## List registrant changes {#listRegistrantChanges}

    GET /:account/registrar/registrant_changes

List all registrant changes in the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id

### Filters

Name | Description
-----|------------
`state` | Filter by state. Valid values: `new`, `pending`, `completed`, `cancelling`, `cancelled`. Defaults to open states (`new`, `pending`) if not specified.
`domain_id` | Only include domains containing given domain ID
`contact_id` | Only include domains containing given contact ID

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort registrant changes by ID

The default sorting policy is by ascending `id`.

### Example

List registrant changes for the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/registrar/registrant_changes

### Response

Responds with HTTP 200 on success

~~~json
<%= pretty_print_fixture("/api/listRegistrantChanges/success.http") %>
~~~

## Start registrant change {#createRegistrantChange}

    POST /:account/registrar/registrant_changes

Start a registrant change for a domain.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`domain_id` | `string`, `integer` | The domain name or id
`contact_id` | `string`, `integer` | The contact id
`extended_attributes` | `object` | Extended attributes required for certain TLDs. See [TLD extended attributes](/v2/tlds/#getTldExtendedAttributes) for details.

### Example

Start a registrant change for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '{"domain_id":"example.com","contact_id":"2"}' \
          https://api.dnsimple.com/v2/1010/registrar/registrant_changes

### Response

Responds with HTTP 201 if the registrant change is completed immediately.

Responds with HTTP 202 if the registrant change has started and is pending completion.

~~~json
<%= pretty_print_fixture("/api/createRegistrantChange/success.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2#bad-request/) if the registrant change cannot be started.

Responds with [HTTP 401](/v2#unauthorized/) in case of authentication issues.

## Check registrant change requirements {#checkRegistrantChange}

    POST /:account/registrar/registrant_changes/check

Check the requirements for a registrant change before starting it.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`domain_id` | `string`, `integer` | The domain name or id
`contact_id` | `string`, `integer` | The contact id

### Example

Check registrant change requirements for the domain `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '{"domain_id":"example.com","contact_id":"2"}' \
          https://api.dnsimple.com/v2/1010/registrar/registrant_changes/check

### Response

Responds with HTTP 200 on success

~~~json
<%= pretty_print_fixture("/api/checkRegistrantChange/success.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2#bad-request/) if the check cannot be performed.

Responds with [HTTP 401](/v2#unauthorized/) in case of authentication issues.

## Retrieve a registrant change {#getRegistrantChange}

    GET /:account/registrar/registrant_changes/:registrant_change

Retrieve the details of an existing registrant change.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:registrant_change` | `integer` | The registrant change id

### Example

Get registrant change `101` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/registrar/registrant_changes/101

### Response

Responds with HTTP 200 on success

~~~json
<%= pretty_print_fixture("/api/getRegistrantChange/success.http") %>
~~~

### Errors

Responds with [HTTP 404](/v2#not-found/) if the registrant change doesn't exist.

Responds with [HTTP 401](/v2#unauthorized/) in case of authentication issues.

## Cancel a registrant change {#deleteRegistrantChange}

    DELETE /:account/registrar/registrant_changes/:registrant_change

Cancel an ongoing registrant change.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:registrant_change` | `integer` | The registrant change id

### Example

Cancel registrant change `101` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v2/1010/registrar/registrant_changes/101

### Response

Responds with HTTP 204 if the registrant change is cancelled immediately.

Responds with HTTP 202 if the registrant change is being cancelled (state is `cancelling`).

~~~json
<%= pretty_print_fixture("/api/deleteRegistrantChange/success_async.http") %>
~~~

<note>
The code block above shows the response for HTTP 202. HTTP 204 responses have no body.
</note>

### Errors

Responds with [HTTP 400](/v2#bad-request/) if the registrant change cannot be cancelled.

Responds with [HTTP 401](/v2#unauthorized/) in case of authentication issues.

Responds with [HTTP 404](/v2#not-found/) if the registrant change doesn't exist.

