---
title: Accounts API | DNSimple API v2 (Beta)
excerpt: This page documents the DNSimple accounts API v2 endpoint.
---

# Accounts API

* TOC
{:toc}


## List accounts {#listAccounts}

Gets the accounts associated with the current credentials.

~~~
GET /accounts
~~~

### Example

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/accounts

### Response

Responds with HTTP 200. Depending on how you are authenticated you will see all the accounts you have access to or the account you used to authenticate.

##### Example when authenticated with an Account access token

~~~json
<%= pretty_print_fixture("/listAccounts/success-account.http") %>
~~~

##### Example when authenticated with an User access token

~~~json
<%= pretty_print_fixture("/listAccounts/success-user.http") %>
~~~
