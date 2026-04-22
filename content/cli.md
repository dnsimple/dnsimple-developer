---
title: DNSimple CLI
excerpt: Install and use the official DNSimple command-line interface for registering domains, managing DNS zones, and more automation.
---

# DNSimple CLI

The DNSimple CLI brings the [DNSimple API v2](/v2/) to your terminal. Use it to inspect accounts, manage domains and DNS records, work with certificates, test against the [Sandbox](/sandbox/), and build scripts without writing raw HTTP requests.

* TOC
{:toc}

---

## Quick start

Install the CLI, authenticate with an API token, then run your first command:

```shell
brew install dnsimple/tap/dnsimple

dnsimple auth login
dnsimple whoami
dnsimple domains list
```

Create your API token from the DNSimple application:

- Production tokens: [dnsimple.com/user](https://dnsimple.com/user)
- Sandbox tokens: [sandbox.dnsimple.com/user](https://sandbox.dnsimple.com/user)

The CLI currently supports API token authentication, including classic and scoped API tokens.

## Installation

### macOS and Linux

Use Homebrew for the simplest install and update path:

```shell
brew install dnsimple/tap/dnsimple
```

You can also use the install script:

```shell
curl -fsSL http://cli-beta.dnsimple.com/install.sh | sh
```

The install script detects your operating system and architecture, downloads the latest release from the public [dnsimple/homebrew-tap release mirror](https://github.com/dnsimple/homebrew-tap/releases/latest), and installs the `dnsimple` binary.

### Windows

Use the PowerShell installer:

```powershell
irm "https://cli-beta.dnsimple.com/install.ps1" | iex
```

The installer downloads the latest Windows archive, installs `dnsimple.exe`, and adds the install directory to your user `PATH`.

You can also install manually:

1. Download the latest `dnsimple_<version>_windows_amd64.zip` or `dnsimple_<version>_windows_arm64.zip` from the [public release mirror](https://github.com/dnsimple/homebrew-tap/releases/latest).
2. Extract `dnsimple.exe`.
3. Move `dnsimple.exe` to a directory on your `PATH`, such as `%USERPROFILE%\bin`.
4. Open a new terminal and verify the installation.

```powershell
dnsimple --version
```

### Developer install

If you are developing or testing the CLI itself, install from source with Go 1.25 or newer:

```shell
go install github.com/dnsimple/dnsimple-cli/cmd/dnsimple@latest
```

Or build from a local checkout:

```shell
git clone https://github.com/dnsimple/dnsimple-cli.git
cd dnsimple-cli
make build
```

The compiled binary is written to the `bin/` directory.

## AI-focused design

The DNSimple CLI is designed to work well for both humans and AI agents. Commands have predictable names, consistent flags, structured JSON output, and explicit context controls so agents can inspect account state before making changes.

Use `dnsimple ai` inside an agent workflow to load the installed CLI context before asking the agent to write or run automation. For example, start with this instruction:

> Load context from the `dnsimple ai` command.

The command prints an AI-friendly description of available commands, flags, and common workflows. This helps an agent choose the right command, understand authentication and sandbox behavior, and avoid inventing unsupported CLI options.

## Authentication

The CLI uses authentication contexts. A context stores the API token, account, and environment for later commands. You can keep multiple contexts, such as one for production and one for sandbox, and switch between them.

```shell
# Log in to production.
dnsimple auth login

# Log in to sandbox and store it as a separate context.
dnsimple auth login --sandbox

# List stored contexts. The active context is marked with *.
dnsimple auth list

# Switch by context name or account ID.
dnsimple auth switch sandbox

# Show the resolved account and environment.
dnsimple auth status
```

Use `--name` to choose your own context name:

```shell
dnsimple auth login --name work
dnsimple auth login --sandbox --name sandbox-work
```

For scripts or machines where interactive prompts are not convenient, read a token from standard input:

```shell
printf '%s' "$DNSIMPLE_TOKEN" | dnsimple auth login --with-token --name ci
```

Remove a stored context when you no longer need it:

```shell
dnsimple auth logout --name sandbox-work
```

## Contexts and overrides

Every command uses the active context unless you override it. Use `--context` to run one command with a stored context without changing the active one:

```shell
dnsimple --context sandbox zones list
```

You can also override fields per invocation. This is useful in CI, scheduled jobs, and parallel shells where changing local state would be surprising.

```shell
DNSIMPLE_TOKEN="$TOKEN" dnsimple --account 1010 --sandbox zones list

dnsimple \
  --token "$TOKEN" \
  --account 1010 \
  --sandbox \
  records list example.com
```

The override chain is field-by-field: command flags take precedence, then matching environment variables, then the active stored context.

## Output formats

By default, commands print readable tables. Use `--json` for structured output:

```shell
dnsimple domains list --json
dnsimple records list example.com --type A --json
```

JSON output preserves the API wrapper shape, including top-level `data` and optional `pagination` keys.

Use `--format` for custom Go templates. The template is evaluated against the unwrapped resource data:

```shell
dnsimple domains get example.com --format '{{.Name}}'

dnsimple domains list \
  --format '{{range .}}{{.Name}}{{printf "\n"}}{{end}}'
```

To discover the available fields for a command, inspect the same command with `--json` and use the fields under `data`.

## Sandbox

Use Sandbox before running changes against production. Sandbox has a separate application, separate API host, and separate tokens:

```shell
dnsimple auth login --sandbox --name sandbox
dnsimple --context sandbox domains list
```

You can also make one command use Sandbox without storing a context:

```shell
DNSIMPLE_TOKEN="$SANDBOX_TOKEN" dnsimple --sandbox --account 1010 zones list
```

Production tokens do not work in Sandbox, and Sandbox tokens do not work in production.

## Shell completion

Generate completion scripts for your shell:

```shell
dnsimple completion bash
dnsimple completion zsh
dnsimple completion fish
dnsimple completion powershell
```

For quick loading examples, run:

```shell
dnsimple completion --help
```

## Common workflows

### Inspect your account

Start with read-only commands to confirm which account and environment you are using:

```shell
dnsimple whoami
dnsimple accounts list
dnsimple domains list
dnsimple zones list
```

Use filters when the account has many domains or records:

```shell
dnsimple domains list --name-like example --sort name:asc
dnsimple records list example.com --type A --name www
dnsimple records list example.com --name-like api --all
```

### Add DNS records for a zone

This flow creates a hosted domain, activates DNS for its zone, and adds a record:

```shell
dnsimple domains create example.com
dnsimple zones activate example.com

dnsimple records create example.com \
  --type A \
  --name www \
  --content 192.0.2.10 \
  --ttl 3600
```

`example.com` is both the domain name and the zone name. Use the same value with `domains`, `zones`, and `records` commands.

### Update DNS records for a zone

List the records first, copy the record ID you want to change, then update or delete that record:

```shell
dnsimple records list example.com --type A --name www

dnsimple records update example.com 12345 \
  --content 192.0.2.20 \
  --ttl 600

dnsimple records check-distribution example.com 12345

dnsimple records delete example.com 12345
```

Destructive commands prompt for confirmation in interactive terminals. In non-interactive scripts, pass `--yes` explicitly:

```shell
dnsimple records delete example.com 12345 --yes
```

Deleting a registered domain is higher risk because it downgrades the domain to hosted and permanently removes registration metadata. Non-interactive deletion of registered domains requires both confirmations:

```shell
dnsimple domains delete example.com --yes --confirm-registered-domain
```

### Check and register domains

Use `registrar check` for normal availability checks available to every account:

```shell
dnsimple registrar check example.com
dnsimple registrar prices example.com
```

Register a domain with an existing contact:

```shell
dnsimple registrar register example.com \
  --registrant-id 12345 \
  --whois-privacy \
  --auto-renew
```

Some TLDs require extended attributes:

```shell
dnsimple registrar register example.us \
  --registrant-id 12345 \
  --extended-attribute nexus_category=C11 \
  --extended-attribute application_purpose=P1
```

If you have access to the high-volume Domain Research product, use `research status` for bulk availability lookups:

```shell
dnsimple research status example.com
```

### Manage webhooks

Create webhooks for account events and inspect or remove them later:

```shell
dnsimple webhooks create --url https://example.com/dnsimple/webhook
dnsimple webhooks list
dnsimple webhooks get 12345
dnsimple webhooks delete 12345
```

See the [webhooks documentation](/v2/webhooks/webhooks/) for event payloads and delivery behavior.
