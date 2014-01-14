---
title: Authentication
---

# Authentication

There are three ways to authenticate through DNSimple API. The **Basic Authentication** and the **DNSimple API token** grant access to all API methods, the **DNSimple Domain token** provides access to limited resources under the scope of a domain.

* TOC
{:toc}


## HTTP Basic Authentication

HTTP Basic Authentication credentials are the same as your account: your email address and password.

    curl  -u "<email>:<password>" \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/users/me


## DNSimple API token

The DNSimple API Token is a token that uniquely identifies a DNSimple account. You can create, reset or clear your API token by going to [your account page](https://dnsimple.com/account).

The token must be sent in a header called `X-DNSimple-Token`. The `X-DNSimple-Token` header is your email address joined with your API token separated by a colon. 

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/users/me

For example, if your email is `example@example.com` and your token is `1234567890`, the request will be

    curl  -H 'X-DNSimple-Token: example@example.com:1234567890' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/users/me

## DNSimple Domain token

The DNSimple Domain Token is a token that uniquely identifies a domain in the DNSimple account. You can find the domain token in the domain page.

The token must be sent in a header called `X-DNSimple-Domain-Token`. The `X-DNSimple-Domain-Token` header must contain the token only.

    curl  -H 'X-DNSimple-Domain-Token: <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/:domain

For example, if the token for the domain `example.com` is `1234567890`, the request will be

    curl  -H 'X-DNSimple-Domain-Token: 1234567890' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/example.com

The domain token grants access only to certain methods of the corresponding domain. You can use the domain token to authenticate the following domain API calls:

- [Get a domain](/domains/#get-a-domain)
- [Manage domain record](/domains/records/)

