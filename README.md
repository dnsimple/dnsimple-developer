# DNSimple API Documentation

This is the DNSimple API documentation built with [nanoc](http://nanoc.stoneship.org/).

## Setup

Ruby 1.9 is required to build the site, all the dependencies are managed using Bundler.

    $ git clone git@github.com:aetrion/dnsimple-developer.git
    $ cd dnsimple-docs
    $ bundle

For a list of `nanoc` commands type

    $ nanoc --help

## Development

`nanoc` ships with an autocompiler that automatically compiles changed files on every HTTP request.

    $ nanoc aco

    Running on http://0.0.0.0:3000/
    [2012-09-26 15:07:52] INFO  WEBrick 1.3.1
    [2012-09-26 15:07:52] INFO  ruby 1.9.2 (2012-04-20) [x86_64-darwin12.1.0]
    [2012-09-26 15:07:52] INFO  WEBrick::HTTPServer#start: pid=23121 port=3000
