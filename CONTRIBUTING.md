# Contributing

## Setup

1. Clone this repository
1. Run `asdf install`
1. Run `bundle install`
1. Start your local instance with `rake run`

The site will be visible at [localhost:3000](http://localhost:3000).

## Development

Use `rake run` to start the site. The server will automatically re-compiles changed files.

## Deployment

The `main` branch is deployed automatically via Netlify.

## Creating new fixtures

- Use the sandbox API. Avoid using the production API as much as possible.
- Run `bin/download_fixture.sh YOUR_TOKEN HTTP_METHOD URL > fixtures/v2/api/OPERATION/meaningful_name.http`

Example:

```
bin/download_fixture.sh 0123456789abcdefghijklmnopqrstuv GET https://api.sandbox.dnsimple.com/v2/tlds > fixtures/v2/api/listTlds/success.http`
bin/download_fixture.sh 0123456789abcdefghijklmnopqrstuv POST https://api.sandbox.dnsimple.com/v2/registrar/domains/example-delta.com/registrations "{\"registrant_id\":2715}" > fixtures/v2/api/registerDomain/success.http
```
