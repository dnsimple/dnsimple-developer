# Client links sweep

The nine DNSimple client libraries link to this site from their doc comments. When a page moves or a heading anchor changes, those links go stale and nothing tells us. Most of them keep a live page and lose only the fragment, for example `/v2/domains/#list`. The browser never sends the fragment to the server, so the site answers 200 and an HTTP link checker reports no problem.

The sweep closes that gap. It reads the page and anchor map that this site publishes, it reads every link in the client repositories, and it reports the links that the site cannot serve.

## How to run the sweep

Run the sweep against the live site and the main branch of every client:

```shell
rake links:clients
```

The task downloads a tarball of each client from GitHub, so it needs network access. It takes about a minute.

Run the script directly when you want to change what it reads:

```shell
ruby _sweep/client_links.rb --help
ruby _sweep/client_links.rb --local ../dnsimple-ruby --local ../dnsimple-go
ruby _sweep/client_links.rb --index output/search.json
ruby _sweep/client_links.rb --format json
```

Use `--local` to check a working copy instead of a download. Use `--index output/search.json` to check against your own branch: run `rake compile` first, and the sweep then uses the map that your branch produces instead of the published one. Use `--format json` when another program reads the report.

## How to read the report

The report lists the stale links for each repository, then a count for each repository and a total:

```
dnsimple-ruby:
  lib/dnsimple/client/zones.rb:8  https://developer.dnsimple.com/v2/zones/#list  (page /v2/zones/ has no anchor #list)
  lib/dnsimple/client/webhooks.rb:72  https://developer.dnsimple.com/v2/webooks/#delete  (page /v2/webooks/ does not exist)

dnsimple-ruby         124 links   64 stale
total                1092 links  221 stale
```

Each line gives the file and the line in the client repository, the link, and the reason:

- `page ... does not exist` — the site publishes no page at that path. The link is wrong, or the page moved without a redirect rule.
- `page ... has no anchor #...` — the page exists and the fragment does not. This is the case that an HTTP link checker cannot find.

The `links` column counts every link to this site, and the `stale` column counts the links that the sweep reports. A link counts once for each place it appears. The sweep exits with status 1 when it reports one or more stale links.

The fix belongs in the client repository. Open a pull request there that points the link at the current page and anchor.

## What the sweep checks

The sweep reads `/search.json`, which is the compiled page and anchor map that `lib/search.rb` writes for the site search. The map holds the final path of each page and every `id` attribute on it, so the sweep does not repeat the nanoc routing rules or the kramdown anchor rules.

The sweep applies the redirect rules in `_redirects` and in `netlify.toml` before it reads the anchors, because the browser keeps the fragment across a redirect. It does not follow a rule that answers 404, because that rule states that the page is absent.

The sweep checks a link only when the link carries a fragment. The response status already covers a link without one.

The map holds the markdown pages of the site. A link into a page that is not markdown, such as the home page, and a link to a file, such as `/v2/openapi.yml`, carry no fragment in the clients today and the sweep skips them.

## When the sweep runs

The `Check client links` workflow runs every Monday, and on demand from the Actions tab. It writes the report to the job summary and it fails when it reports a stale link.

The sweep runs in this repository only. It does not run in the client repositories, so a rename on this site cannot turn an unrelated client pull request red.

`rake` does not run the sweep. The unit tests in `_test/client_links_test.rb` cover the map, the redirect rules, and the link parser, and they need no network access.

## How to add a client

Add the repository to `CLIENTS` in `_sweep/client_links.rb`.
