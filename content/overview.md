---
title: Overview
---

# Overview


## End Point

The DNSimple API end-point URL is `https://dnsimple.com/`.


## Authentication

There are two authentication methods availabe: `HTTP Basic Authentication` or the `X-DNSimple-Token` header.

HTTP Basic Authentication credentials are the same as your account: your email address and password.

    curl -u "<email>:<password>" https://dnsimple.com/users/me

The X-DNSimple-Token header is your email address joined with your API token separated by a colon. You may create, reset or clear your API token by going to [your Account page](https://dnsimple.com/account).

    curl -H "X-DNSimple-Token: <email>:<token>" https://dnsimple.com/users/me


## Requests

All requests should be sent with `application/json` content type, but form-encoded data can be sent as well using the `application/x-www-form-urlencoded` content type.

The examples below are shown with JSON.

All requests must include the `Accept` header set to `application/json`.
