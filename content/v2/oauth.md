---
title: OAuth API | DNSimple API v2
excerpt: This page documents the OAuth 2 flow you can use to access the DNSimple API.
---

# OAuth

* TOC
{:toc}

---

DNSimple supports [OAuth 2.0](http://oauth.net/) for authenticating API requests. OAuth 2 is a protocol that lets external applications request authorization to private details in a user's DNSimple account without getting their password. This is preferred over Basic Authentication because tokens can be revoked by users at any time.

Developers need to register their application before getting started. A registered OAuth application is assigned a unique client ID, and the way it authenticates depends on its type:

- **Confidential clients** are server-side web apps that can keep a secret. They are assigned a client ID and a client secret, and authenticate at the token endpoint with that secret. The client secret should not be shared.
- **Public clients** are native, mobile, single-page, or command-line apps that cannot keep a secret. They authenticate with [PKCE](https://www.rfc-editor.org/rfc/rfc7636) (Proof Key for Code Exchange) instead of a client secret. See [Native and CLI apps](#native-and-cli-apps-loopback-redirect-uris).

> [!NOTE]
> If you do not see a client type choice when you register an application, your account registers web apps (confidential clients) by default. Public clients can be enabled on request; contact DNSimple support to register one for your account.

## Web Application Flow

This is a description of the OAuth 2 flow for authorizing users from 3rd party web sites. The OAuth 2 specification is described in the [RFC 6749](http://tools.ietf.org/html/rfc6749#section-4).

> [!NOTE]
> The API currently supports only the OAuth 2 [Authorization Code Grant](http://tools.ietf.org/html/rfc6749#section-4.1) flow. Therefore, [the only supported value for the `response_type` is `code`](http://tools.ietf.org/html/rfc6749#section-3.1.1).
>
> Public clients must secure the flow with [PKCE](https://www.rfc-editor.org/rfc/rfc7636) (Proof Key for Code Exchange). The only accepted `code_challenge_method` is `S256`; the `plain` method is not supported.

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
`redirect_uri`  | Where to redirect the user after authorization has completed. This must be the exact URI registered or a subdirectory. Native and CLI apps can register a [loopback redirect URI](#native-and-cli-apps-loopback-redirect-uris) whose port is matched leniently.
`scope`         | We currently don't use this field.
`code_challenge`        | **Required for public clients** ([PKCE](https://www.rfc-editor.org/rfc/rfc7636)). The base64url-encoded SHA-256 digest of your code verifier. Optional for confidential clients, where it adds defense-in-depth.
`code_challenge_method` | **Required when `code_challenge` is present**. Must be `S256`.

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
`client_secret` | **Required for confidential clients**. The client secret you received from DNSimple when you registered the application. Ignored for public clients.
`code_verifier` | **Required for public clients** ([PKCE](https://www.rfc-editor.org/rfc/rfc7636)). The code verifier whose SHA-256 challenge matches the `code_challenge` sent to `/oauth/authorize`. Ignored for confidential clients.
`code`          | **Required**. The code acquired in the previous authorization step.
`redirect_uri`  | **Required if it was included in the authorization request**. Only used to validate that it matches the value sent to the original `/oauth/authorize`, not used to redirect again.
`state`         | **Required if it was included in the authorization request**. The state content originally passed to `/oauth/authorize`.

You'll receive a JSON response. If the request is successful, the response will include an access token, the token type and the account ID. The token type will always be `bearer`.

##### Example Response

```json
<%= pretty_print_fixture("/api/oauthAccessToken/success.http") %>
```

##### Error Responses

If the request fails, you'll receive a JSON response with an `error` code and an `error_description`. The HTTP status and the `error` value depend on the failure:

`invalid_grant`   | **HTTP 400**. The authorization `code` is unknown or expired, or it was not issued to the supplied `client_id`. For public clients, this is also returned when the PKCE `code_verifier` does not match the `code_challenge` from the authorization request.
`invalid_client`  | **HTTP 401**. Client authentication failed, for example an incorrect `client_secret`.
`invalid_request` | **HTTP 400**. The request is otherwise invalid, for example an unsupported `grant_type`, a `redirect_uri` / `state` that does not match the original authorization request, or a public-client authorization request with a missing or invalid PKCE `code_challenge`.

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

## Native and CLI apps (loopback redirect URIs)

Native applications such as command-line tools and desktop apps are public clients: they cannot keep a client secret, so they secure the flow with [PKCE](https://www.rfc-editor.org/rfc/rfc7636) and receive the authorization `code` on a loopback callback running on the local machine.

Register a loopback callback URL as your application's redirect URI:

```
http://127.0.0.1/callback
http://[::1]/callback
```

A native app binds its callback server to an ephemeral port chosen at runtime, so it cannot register that port in advance. As described in [RFC 8252 section 7.3](https://www.rfc-editor.org/rfc/rfc8252#section-7.3), DNSimple ignores the port of a loopback redirect URI when both the registered URI and the runtime URI use a loopback IP literal. Your app can therefore listen on any available port, for example `http://127.0.0.1:53241/callback`, and the redirect URI will still match.

> [!NOTE]
> Port leniency applies only to the loopback IP literals `127.0.0.1` and `[::1]`. The hostname `localhost` is matched strictly, including its port, so use an IP literal if you need a dynamic port.

The [DNSimple CLI](/cli/) uses exactly this flow: it is a public client that runs the Authorization Code grant with PKCE and a loopback callback to log you in through your browser.
