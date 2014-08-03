---
title: Authentication
---

# Authentication

* TOC
{:toc}

---

There are three ways to authenticate through DNSimple API. The **HTTP Basic Authentication** and the **API token** grant access to all API methods, the **Domain token** provides access to limited resources under the scope of a domain.

## Global authentication

Global authentication mechanisms gives you accesses to all the resources that belong to an account, as opposite to scoped authentication mechanisms.

### HTTP Basic Authentication

To use HTTP Basic Authentication with the DNSimple API, simply send the email address and password associated with the account.

~~~bash
curl  -u '<email>:<password>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v1/user
~~~

<note>
For users with two-factor authentication enabled, [Basic Authentication requires an extra step](#twofa).
</note>

### API token {#api-token}

The API Token is a token that uniquely identifies a DNSimple account. You can create, reset or clear your API token by going to [your account page](https://dnsimple.com/account).

The token must be sent in a header called `X-DNSimple-Token`. The `X-DNSimple-Token` header is your email address joined with your API token separated by a colon. 

~~~bash
curl  -H 'X-DNSimple-Token: <email>:<token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v1/user
~~~

For example, if your email is `example@example.com` and your token is `1234567890`, the request will be

~~~bash
curl  -H 'X-DNSimple-Token: example@example.com:1234567890' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v1/user
~~~

## Single-domain authentication {#domain-token}

The Domain Token is a token that uniquely identifies a domain in the DNSimple account. You can find the domain token in the domain page.

The token must be sent in a header called `X-DNSimple-Domain-Token`. The `X-DNSimple-Domain-Token` header must contain the token only.

~~~bash
curl  -H 'X-DNSimple-Domain-Token: <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v1/domains/:domain
~~~

For example, if the token for the domain `example.com` is `1234567890`, the request will be

~~~bash
curl  -H 'X-DNSimple-Domain-Token: 1234567890' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v1/domains/example.com
~~~

The domain token grants access only to certain methods of the corresponding domain. You can use the domain token to authenticate the following domain API calls:

- [Get a domain](/domains/#get)
- [Manage domain record](/domains/records/)

## Working with two-factor authentication {#twofa}

<info>
#### Two-factor authentication support is currently not enabled by default

The two-factor authentication support is in beta, and it's not currently enabled by default. To enable it, send the additional HTTP header `X-DNSimple-2FA-Strict` with value `1`.

You should start testing and updating your integration to support 2FA as soon as possible.

2FA in API will be eventually turned on by default in September. At that point, the `X-DNSimple-2FA-Strict` will no longer have effect since it will be the default for everyone.
</info>

For users with two-factor authentication enabled, HTTP Basic Authentication requires an extra step.

When you attempt to authenticate with HTTP Basic Authentication, the server will respond with a 401 and an `X-DNSimple-OTP: required` header. This indicates that a two-factor authentication token is needed (in addition to the username and password).

In addition to the HTTP Basic Authentication credentials, you must send the one-time password (aka the 2FA token) in the `X-DNSimple-OTP` header. If the OTP token is valid, the server will return a successful response with a two-factor exchange token in the `X-DNSimple-OTP-Token` header.

You can use this exchange token to authenticate subsequent requests, given that OTP tokens expires every minute and you don't really want to provide one on every request.

To authenticate with the two-factor exchange token, use the token as username and the password `x-2fa-basic`.

~~~bash
curl  -u '<2fa-exchange-token>:x-2fa-basic' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v1/user
~~~


