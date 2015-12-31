---
title: OAuth | DNSimple API v2
excerpt: This page documents the OAuth 2 flow you can use to access the DNSimple API.
---

# OAuth

* TOC
{:toc}

---

DNSimple supports [OAuth 2.0](http://oauth.net/) for authenticating API requests. OAuth 2 is a protocol that lets external applications request authorization to private details in a user's DNSimple account without getting their password. This is preferred over Basic Authentication because tokens can be revoked by users at any time.

Developers need to register their application before getting started. A registered OAuth application is assigned a unique client ID and client secret. The client secret should not be shared.

## Web Application Flow

This is a description of the OAuth 2 flow for authorizing users from 3rd party web sites. The OAuth 2 specification is described in the [RFC 6749](http://tools.ietf.org/html/rfc6749#section-4).

<info>
The API currently supports only the OAuth 2 [Authorization Code Grant](http://tools.ietf.org/html/rfc6749#section-4.1) flow. Therefore, [the only supported value for the `response_type` is `code`](http://tools.ietf.org/html/rfc6749#section-3.1.1).
</info>

### Step 1 - Authorization

Your web or mobile app should redirect users to the following URL:

~~~
https://dnsimple.com/oauth/authorize
~~~

The following values should be passed as GET parameters:

`response_type` | **Required**. The grant type requested. We currently only support `code`.
`client_id`     | **Required**. The client ID you received from DNSimple when you registered the application.
`redirect_uri`  | Where to redirect the user after authorization has completed. This must be the exact URI registered or a subdirectory. See details below about [redirect urls](#redirect-urls).
`scope`         | We currently don't use this field.
`state`         | An unguessable random string. It is used to protect against cross-site request forgery attacks and it will be passed back to your redirect URI.

Because `/oauth/authorize` is a website, there is no direct return value. However, after the user authorizes your app, they will be sent to your redirect URI.

If the request is successful, these parameters are passed in the query string in the URL:

`code`          | The authorization code, which can be used in the next step to retrieve a bearer token.
`state`         | The state content, if any, originally passed to `/oauth/authorize`.

If an error occurs, including if the user has chosen not to authorize the app, the following parameters will be included in the redirect URI:

`error`             | An error code per [Section 4.1.2.1 of the OAuth 2.0 spec](http://tools.ietf.org/html/rfc6749#section-4.1.2.1).
`error_description` | A user-friendly description of the error that occurred.
`state`             | The state content, if any, originally passed to `/oauth/authorize`.

### Step 2 - Access Token

### Step 3 - API authentication

The access token allows you to make requests to the API on a behalf of a user. When you'd like to make API calls to DNSimple, simply include the authorization header with each request.

~~~
Authorization: Bearer ACCESS_TOKEN
~~~

Replace `ACCESS_TOKEN` with the real token you received in the previous step. Here's an example with `curl`:

~~~
$ curl -H "Authorization: Bearer ACCESS-TOKEN" https://api.dnsimple.com/v2/whoami
~~~

<info>
If you are using the [sandbox environment](/sandbox/) replace `dnsimple.com` with `sandbox.dnsimple.com`.
</info>

