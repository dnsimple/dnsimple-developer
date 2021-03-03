# DNSimple API Documentation

This is the [DNSimple API documentation](https://developer.dnsimple.com/).

## Usage

This website is built with [nanoc](https://nanoc.ws/). If you want to learn how to run the site locally, or how to contribute, please visit the [CONTRIBUTING](CONTRIBUTING.md) file.

## Structure

These are the most important folders and files to keep in mind while working on this repo:

- `content`: this folder contains the markdown files that generate the site
- `content/v2/openapi.yml`: the API definition described using the OpenAPI specification (see below)
- `examples`: this folder contains the API response fixtures generated from real API calls you can use to test your integrations

## OpenAPI definition

The API behavior is described using the [OpenAPI](https://www.openapis.org/) specification. The definition file is located at [content/v2/openapi.yml](content/v2/openapi.yml).

The OpenAPI description is the main source of truth, and must be kept up to date with the other changes in the site. At the time being, the site and the OpenAPI must be kept in sync manually. That means any change in the markdown documentation files needs to be reflected in the OpenAPI file.

The markdown documentation is a subset of the OpenAPI description. There may be information that - for the sake of brevity - are omitted in the markdown files, and sometimes delegated to the OpenAPI description.
