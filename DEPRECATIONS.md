# Deprecations Roadmap

This document tracks all deprecated features, methods, and fields in the DNSimple API. It serves as a roadmap for deprecations and eventual removals.

### 2021-05-18 - getDomainPremiumPrice endpoint

The endpoint `GET /:account/registrar/domains/:domain/premium_price` was used to check if a domain is premium and retrieve the premium price. It has been superseded by the more comprehensive `getDomainPrices` endpoint which provides pricing information for all domain operations.

**Removal Date:** N/A

**Client Status:**

- Ruby: Complete
- Go: Flagged
- Elixir: Flagged
- Node.js: Flagged
- Java: Flagged
- C#: Complete
- PHP: Flagged
- Python: Flagged
- Rust: Flagged

### 2022-06-01 - Certificate contact_id field

The `contact_id` field in Certificate schema has been deprecated. It is no longer a required field for certificate operations.

**Removal Date:** N/A

**Replacement:** None. This field is no longer required.

**Client Status:**

- Ruby: Not started
- Go: Flagged
- Elixir: Not started
- Node.js: Not started
- Java: Complete
- C#: Flagged
- PHP: Flagged
- Python: Flagged
- Rust: Flagged

### 2021-01-25 - Email forwarding `from` field

The `from` field in Email Forward schema has been renamed to `alias_email` for clarity.

**Removal Date:** N/A

**Replacement:** Use `alias_email` instead.

**Client Status:**

- Ruby: Complete
- Go: Complete
- Elixir: Not started
- Node.js: Complete
- Java: Complete
- C#: Complete
- PHP: Not started
- Python: Complete
- Rust: Complete

### 2021-01-25 - Email forwarding `to` field

The `to` field in Email Forward schema has been renamed to `destination_email` for clarity.

**Removal Date:** N/A

**Replacement:** Use `destination_email` instead.

**Client Status:**

- Ruby: Complete
- Go: Complete
- Elixir: Not started
- Node.js: Complete
- Java: Complete
- C#: Complete
- PHP: Not started
- Python: Complete
- Rust: Complete

### 2023-05-01 - getWhoisPrivacy endpoint

The endpoint `GET /:account/registrar/domains/:domain/whois_privacy` was used to retrieve the WHOIS privacy status for a domain. The WHOIS privacy state can now be retrieved through the `getDomain` endpoint.

**Removal Date:** 2026-01-14 (Completed)

**Replacement:** Use `getDomain` endpoint to retrieve domain WHOIS privacy state.

**Client Status:**

- Ruby: [Complete](https://github.com/dnsimple/dnsimple-ruby/pull/447)
- Go: [Complete](https://github.com/dnsimple/dnsimple-go/pull/237)
- Elixir: [Complete](https://github.com/dnsimple/dnsimple-elixir/pull/305)
- Node.js: [Complete](https://github.com/dnsimple/dnsimple-node/pull/265)
- Java: [Complete](https://github.com/dnsimple/dnsimple-java/pull/231)
- C#: [Complete](https://github.com/dnsimple/dnsimple-csharp/pull/208)
- PHP: [Complete](https://github.com/dnsimple/dnsimple-php/pull/147)
- Python: [Complete](https://github.com/dnsimple/dnsimple-python/pull/484)
- Rust: [Complete](https://github.com/dnsimple/dnsimple-rust/pull/87)

### 2023-05-01 - renewWhoisPrivacy endpoint

The endpoint `POST /:account/registrar/domains/:domain/whois_privacy/renewals` was used to renew the WHOIS privacy service for a domain. WHOIS privacy no longer needs to be renewed as it stays enabled unless explicitly disabled.

**Removal Date:** 2026-01-14 (Completed)

**Replacement:** None. WHOIS privacy no longer requires renewal.

**Client Status:**

- Ruby: [Complete](https://github.com/dnsimple/dnsimple-ruby/pull/447)
- Go: [Complete](https://github.com/dnsimple/dnsimple-go/pull/237)
- Elixir: [Complete](https://github.com/dnsimple/dnsimple-elixir/pull/305)
- Node.js: [Complete](https://github.com/dnsimple/dnsimple-node/pull/265)
- Java: [Complete](https://github.com/dnsimple/dnsimple-java/pull/231)
- C#: [Complete](https://github.com/dnsimple/dnsimple-csharp/pull/208)
- PHP: [Complete](https://github.com/dnsimple/dnsimple-php/pull/147)
- Python: [Complete](https://github.com/dnsimple/dnsimple-python/pull/484)
- Rust: [Complete](https://github.com/dnsimple/dnsimple-rust/pull/87)

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
- **Flagged** - Deprecation endpoints are flagged in the client code
- **In progress** - Work has begun on updating the client
- **Complete** - Client has been updated with replacement
- **N/A** - Not applicable to this client
