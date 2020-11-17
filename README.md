# DNSimple API Documentation

This is the [DNSimple API documentation](https://developer.dnsimple.com/) built with [nanoc](https://nanoc.ws/).

## Setup

1. Clone this repository
1. Run `asdf install`
1. Run `bundle install`
1. Start your local instance with `rake run`

The site will be visible at [localhost:3000](http://localhost:3000).


## Development

Use `rake run` to start the site. The server will automatically re-compiles changed files.


## Deployment

Each commit to master is [deployed automatically via Travis](https://blog.dnsimple.com/2016/04/publish-static-via-travis-to-cloudfront/).

### Manual deployment

To publish the site manually you will need Java (as the static deployer is written in Scala).

Add a `.env` file with following variables, replacing `ACCESS_ID` and `ACCESS_KEY` with the real values.

```
S3_ID=ACCESS_ID
S3_SECRET=ACCESS_KEY
```

Finally, run:

```shell
rake publish
```


## Creating new fixtures

- Use the sandbox API. Avoid using the production API as much as possible.
- Run `bin/download_fixture.sh YOUR_TOKEN HTTP_METHOD URL > fixtures/v2/api/OPERATION/meaningful_name.http`

  Example: `bin/download_fixture.sh 0123456789abcdefghijklmnopqrstuv GET https://api.sandbox.dnsimple.com/v2/tlds > fixtures/v2/api/listTlds/success.http`
           `bin/download_fixture.sh 0123456789abcdefghijklmnopqrstuv POST https://api.sandbox.dnsimple.com/v2/registrar/domains/example-delta.com/registrations "{\"registrant_id\":2715}" > fixtures/v2/api/registerDomain/success.http
