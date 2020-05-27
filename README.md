# DNSimple API Documentation

This is the DNSimple API documentation built with [nanoc](http://nanoc.ws/).

## Setup

1. Clone this repository
2. Run `asdf install`
3. Run `bundle install`
4. Run `yarn`
5. Start your local instance with `yarn live`

To build the openapi.json file, run `rake compile` before starting `yarn live`

## Development

Use `yarn live` to concurrently compile JS and CSS dependencies.
An autocompiler automatically compiles changed files on every HTTP request.

```shell
yarn live

Loading site… done
11:56:37 - INFO - Compilation succeeded.
[2016-12-21 11:56:37] INFO  WEBrick 1.3.1
[2016-12-21 11:56:37] INFO  ruby 2.3.3 (2016-11-21) [x86_64-darwin16]
[2016-12-21 11:56:37] INFO  WEBrick::HTTPServer#start: pid=63695 port=3000
```

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
