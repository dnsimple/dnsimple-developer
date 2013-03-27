---
title: Overview
---

# Overview

* TOC
{:toc}


## End Point

The DNSimple API end-point URL is `https://dnsimple.com/`.


## Authentication

There are two authentication methods availabe: `HTTP Basic Authentication` or the `X-DNSimple-Token` header.

HTTP Basic Authentication credentials are the same as your account: your email address and password.

    curl  -u "<email>:<password>" \
          -H 'Accept: application/json' \
          https://dnsimple.com/users/me

The X-DNSimple-Token header is your email address joined with your API token separated by a colon. You may create, reset or clear your API token by going to [your Account page](https://dnsimple.com/account).

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/users/me


## Requests

All requests should be sent with `application/json` content type, but form-encoded data can be sent as well using the `application/x-www-form-urlencoded` content type.

The examples below are shown with JSON.

All requests must include the `Accept` header set to `application/json`.

## CORS

If you are using the DNSimple API in JavaScript from within a web browser then your browser will need to support CORS.

Our CORS response headers are currently as follows:

    Access-Control-Allow-Origin: *
    Access-Control-Allow-Headers: Authorization,Accepts,Content-Type,X-DNSimple-Domain-Token,X-CSRF-Token,X-Requested-With
    Access-Control-Allow-Methods: GET,POST,PUT,DELETE,OPTIONS

As you can see we allow any origin to access the DNSimple API, so you should be able to embed a JavaScript library directly in your web application if you would like.
