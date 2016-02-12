---
title: Identity | DNSimple API v2
excerpt: This page documents the DNSimple identity API v2 endpoint.
---

# Identity API

* TOC
{:toc}


## Whoami

    GET /whoami

Get details about the current authenticated entity used to access the API.

### Example

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/whoami

### Response

Responds with HTTP 200. Either user or account may be nil, depending on how you are authenticated.

**Example when authenticated with an Account access token**

~~~json
<%= pretty_print_fixture("/whoami/success-account.http") %>
~~~

**Example when authenticated with an User access token**

~~~json
<%= pretty_print_fixture("/whoami/success-user.http") %>
~~~
