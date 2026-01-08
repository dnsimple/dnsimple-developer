---
title: OAuth API | DNSimple API v2
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

> [!NOTE]
> The API currently supports only the OAuth 2 [Authorization Code Grant](http://tools.ietf.org/html/rfc6749#section-4.1) flow. Therefore, [the only supported value for the `response_type` is `code`](http://tools.ietf.org/html/rfc6749#section-3.1.1).

### Step 1 - Authorization

This starts the OAuth 2.0 authorization flow. This isn't an API call — it's the web page that lets the user sign in to DNSimple and authorize your app. After the user decides whether or not to authorize your app, they will be redirected to the URI specified by `redirect_uri`.

Your web or mobile app should redirect users to the following URL:

```
GET https://dnsimple.com/oauth/authorize
```

The following values should be passed as GET parameters:

`response_type` | **Required**. The grant type requested. We currently only support `code`.
`client_id`     | **Required**. The client ID you received from DNSimple when you registered the application.
`state`         | **Required**. An unguessable random string. It is used to protect against cross-site request forgery attacks and it will be passed back to your redirect URI.
`account_id`    | Automatically select a preferred DNSimple account ID when the user arrives at `/oauth/authorize`. If the account is already authorized, the user will be redirected to your `redirect_uri` as a successful request.
`redirect_uri`  | Where to redirect the user after authorization has completed. This must be the exact URI registered or a subdirectory.
`scope`         | We currently don't use this field.

Because `/oauth/authorize` is a website, there is no direct return value. However, after the user authorizes your app, they will be sent to your redirect URI.

If the request is successful, these parameters are passed in the query string in the URL:

`code`          | The authorization code, which can be used in the next step to retrieve a bearer token.
`state`         | The state content, if any, originally passed to `/oauth/authorize`.

If an error occurs, including if the user has chosen not to authorize the app, the following parameters will be included in the redirect URI:

`error`             | An error code per [Section 4.1.2.1 of the OAuth 2.0 spec](http://tools.ietf.org/html/rfc6749#section-4.1.2.1).
`error_description` | A user-friendly description of the error that occurred.
`state`             | The state content, if any, originally passed to `/oauth/authorize`.

### Step 2 - Access Token

This API method is used to exchange the `code` with a bearer token you can use to authenticate to the DNSimple API.

```
POST https://api.dnsimple.com/v2/oauth/access_token
```

The following values should be passed as POST parameters:

`grant_type`    | **Required**. The grant type requested. We currently only support `authorization_code`.
`client_id`     | **Required**. The client ID you received from DNSimple when you registered the application.
`client_secret` | **Required**. The client secret you received from DNSimple when you registered the application.
`code`          | **Required**. The code acquired in the previous authorization step.
`redirect_uri`  | **Required**. Only used to validate that it matches the original `/oauth/authorize`, not used to redirect again.
`state`         | **Required**. The state content originally passed to `/oauth/authorize`.

You'll receive a JSON response. If the request is successful, the response will include an access token, the token type and the account ID. The token type will always be `bearer`.

##### Example Response

```json
<%= pretty_print_fixture("/api/oauthAccessToken/success.http") %>
```

### Step 3 - API authentication

The access token allows you to execute authenticated API requests on a behalf of the user account. When you'd like to make API calls to DNSimple, simply include the authorization header with each request.

```
Authorization: Bearer ACCESS_TOKEN
```

Replace `ACCESS_TOKEN` with the real token you received in the previous step. Here's an example with `curl`:

```
$ curl -H "Authorization: Bearer ACCESS-TOKEN" https://api.dnsimple.com/v2/whoami
```

> [!NOTE]
> If you are using the [sandbox environment](/sandbox/) replace `dnsimple.com` with `sandbox.dnsimple.com`.
