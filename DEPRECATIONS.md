# Deprecations Roadmap

This document tracks all deprecated features, methods, and fields in the DNSimple API. It serves as a roadmap for deprecations and eventual removals.

### 2021-05-18 - getDomainPremiumPrice endpoint

The endpoint `GET /:account/registrar/domains/:domain/premium_price` was used to check if a domain is premium and retrieve the premium price. It has been superseded by the more comprehensive `getDomainPrices` endpoint which provides pricing information for all domain operations.

**Removal Date:** N/A

**Client Status:**

- Ruby: Not started
- Go: Not started
- Elixir: Not started
- Node.js: Not started
- Java: Not started
- C#: Not started
- PHP: Not started
- Python: Not started
- Rust: Not started

### 2022-06-01 - Certificate contact_id field

The `contact_id` field in Certificate schema has been deprecated. It is no longer a required field for certificate operations.

**Removal Date:** N/A

**Replacement:** None. This field is no longer required.

**Client Status:**

- Ruby: Not started
- Go: Not started
- Elixir: Not started
- Node.js: Not started
- Java: Not started
- C#: Not started
- PHP: Not started
- Python: Not started
- Rust: Not started

### 2021-01-25 - Email forwarding `from` field

The `from` field in Email Forward schema has been renamed to `alias_email` for clarity.

**Removal Date:** N/A

**Replacement:** Use `alias_email` instead.

**Client Status:**

- Ruby: Not started
- Go: Not started
- Elixir: Not started
- Node.js: Not started
- Java: Not started
- C#: Not started
- PHP: Not started
- Python: Not started
- Rust: Not started

### 2021-01-25 - Email forwarding `to` field

The `to` field in Email Forward schema has been renamed to `destination_email` for clarity.

**Removal Date:** N/A

**Replacement:** Use `destination_email` instead.

**Client Status:**

- Ruby: Not started
- Go: Not started
- Elixir: Not started
- Node.js: Not started
- Java: Not started
- C#: Not started
- PHP: Not started
- Python: Not started
- Rust: Not started

### 2025-11-13 - Domain push `new_account_email` field

The `new_account_email` field in Domain Push request has been deprecated in favor of `new_account_identifier`, which provides more flexibility in identifying the target account.

**Removal Date:** N/A

**Replacement:** Use `new_account_identifier` instead.

**Client Status:**

- Ruby: Not started
- Go: Not started
- Elixir: Not started
- Node.js: Not started
- Java: Not started
- C#: Not started
- PHP: Not started
- Python: Not started
- Rust: Not started

## Status Legend

- **Not started** - Deprecation not yet addressed in client
- **In progress** - Work has begun on updating the client
- **Complete** - Client has been updated with replacement
- **N/A** - Not applicable to this client
