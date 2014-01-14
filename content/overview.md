---
title: Overview
---

# Overview

* TOC
{:toc}


## URL

All API access is over HTTPS, and accessed from the `api.dnsimple.com` domain.

In order to maintain compatibility in the future, all requests must specify an API version, which is appended to the URL.

    https://api.dnsimple.com/v1/


## Current Version

The current API version is `v1`.

The legacy API (called `v0`) will no longer be available after June 30th. Please switch to API `v1` as soon as possible. Read the [versioned API announcement for more details](http://blog.dnsimple.com/2014/01/versioned-api/).


## Requests

All requests should include the `Accept` header set to `application/json`. All data is sent and received as JSON.

<div class="alert alert-warning">
  <strong>Warning!</strong> Passing form-encoded post data using the `application/x-www-form-urlencoded` content type is deprecated.
</div>


## Authentication

There are three ways to authenticate through DNSimple API. Two of them are global to all the API methods, one provides access to limited resources.

There are two authentication methods availabe: `HTTP Basic Authentication` or the `X-DNSimple-Token` header.

**HTTP Basic Authentication**

    curl  -u "<email>:<password>" \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/users/me

**DNSimple API Token** (sent in a header)

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/users/me

**DNSimple Domain Token** (sent in a header)

    curl  -H 'X-DNSimple-Domain-Token: <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/:domain

The [Authentication](/authentication/) page provides more information about how to use them.


## Cross Origin Resource Sharing

If you are using the DNSimple API in JavaScript from within a web browser then your browser will need to support for Cross Origin Resource Sharing (CORS).

Our CORS response headers are currently as follows:

    Access-Control-Allow-Origin: *
    Access-Control-Allow-Headers: Authorization,Accepts,Content-Type,X-DNSimple-Domain-Token,X-CSRF-Token,X-Requested-With
    Access-Control-Allow-Methods: GET,POST,PUT,DELETE,OPTIONS

As you can see we allow any origin to access the DNSimple API, so you should be able to embed a JavaScript library directly in your web application if you would like.
