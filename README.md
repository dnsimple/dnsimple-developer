# DNSimple API Documentation

This is the DNSimple API documentation built with [nanoc](http://nanoc.stoneship.org/).

## Setup

Ruby 2 is required to build the site, all the dependencies are managed using Bundler.

    $ git clone https://github.com/dnsimple/dnsimple-developer.git
    $ cd dnsimple-developer
    $ bundle

For a list of `nanoc` commands type

    $ nanoc --help

## Development

`nanoc` ships with an autocompiler that automatically compiles changed files on every HTTP request.

    $ bundle exec nanoc live

    Loading site… done
    11:56:37 - INFO - Compilation succeeded.
    [2016-12-21 11:56:37] INFO  WEBrick 1.3.1
    [2016-12-21 11:56:37] INFO  ruby 2.3.3 (2016-11-21) [x86_64-darwin16]
    [2016-12-21 11:56:37] INFO  WEBrick::HTTPServer#start: pid=63695 port=3000


## Deployment

Each commit to master is [deployed automatically via Travis](https://blog.dnsimple.com/2016/04/publish-static-via-travis-to-cloudfront/).

### Manual deployment

To publish the site manually you will need Java (as the static deployer is written in Scala).

Add a `.env` file with following variables, replacing `ACCESS_ID` and `ACCESS_KEY` with the real values.

    S3_ID=ACCESS_ID
    S3_SECRET=ACCESS_KEY

Finally, run:

    $ rake publish
