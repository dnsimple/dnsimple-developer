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

## Content Writing Guidelines

### Callouts

Callouts provide a consistent, structured way to highlight important information in documentation. Use GitHub Flavored Markdown callout syntax:

**Available callout types:**

- `[!NOTE]` - General informational notes (blue)
- `[!TIP]` - Helpful tips or suggestions (green)
- `[!WARNING]` - Important warnings or cautions (orange/yellow)
- `[!DANGER]` - Critical warnings about dangerous operations (red)

**Syntax:**

```markdown
> [!NOTE]
> Your callout content here. Can span multiple lines.
> Each line should start with `>`.
```

**Examples:**

Display a note about API requirements:

```markdown
> [!NOTE]
> The domain must be delegated to DNSimple for this operation to succeed.
```

Show a warning about plan requirements:

```markdown
> [!WARNING]
> This feature requires a Teams or Enterprise plan. If the feature is not enabled, you will receive an HTTP 412 response code.
```

Provide a helpful tip:

```markdown
> [!TIP]
> Use the sandbox API for testing to avoid affecting production domains.
```

**Best practices:**

- Use callouts sparingly to maintain impact
- Choose the appropriate callout type for your message:
  - Use `[!NOTE]` for general supplementary information or requirements
  - Use `[!WARNING]` for important caveats, plan requirements, or potential issues
  - Use `[!TIP]` for helpful suggestions or best practices
  - Use `[!DANGER]` for operations that could cause data loss or irreversible changes
- Keep callout content concise and focused
- Place callouts near relevant content, not at the end of sections
- Ensure callouts provide actionable information relevant to the API documentation context

## Creating new fixtures

- Use the sandbox API. Avoid using the production API as much as possible.
- Run `bin/download_fixture.sh YOUR_TOKEN HTTP_METHOD URL > fixtures/v2/api/OPERATION/meaningful_name.http`

Example:

```shell
bin/download_fixture.sh 0123456789abcdefghijklmnopqrstuv GET https://api.sandbox.dnsimple.com/v2/tlds > fixtures/v2/api/listTlds/success.http`
bin/download_fixture.sh 0123456789abcdefghijklmnopqrstuv POST https://api.sandbox.dnsimple.com/v2/registrar/domains/example-delta.com/registrations "{\"registrant_id\":2715}" > fixtures/v2/api/registerDomain/success.http
```
