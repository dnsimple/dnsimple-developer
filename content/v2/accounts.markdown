---
title: Accounts API | DNSimple API v2
excerpt: This page documents the DNSimple accounts API v2 endpoint.
---

# Accounts API

* TOC
{:toc}


## Account attributes {#account-attributes}

Please refer to the definition of the `Account` data type in [our OpenAPI documentation](/v2/openapi.yml).


## List accounts {#listAccounts}

Lists the accounts the current authenticated entity has access to.

~~~
GET /accounts
~~~

### Example

~~~
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/accounts
~~~

### Response

Responds with HTTP 200. Depending on how you are authenticated you will see all the accounts you have access to or the account you used to authenticate.

##### Example when authenticated with an Account access token

~~~json
<%= pretty_print_fixture("/api/listAccounts/success-account.http") %>
~~~

##### Example when authenticated with an User access token

~~~json
<%= pretty_print_fixture("/api/listAccounts/success-user.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2#unauthorized) in case of case of authentication issues.