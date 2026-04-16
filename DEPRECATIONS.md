# Deprecations Roadmap

This document tracks all deprecated features, methods, and fields in the DNSimple API. It serves as a roadmap for deprecations and eventual removals.

### 2021-05-18 - getDomainPremiumPrice endpoint

The endpoint `GET /:account/registrar/domains/:domain/premium_price` was used to check if a domain is premium and retrieve the premium price. It has been superseded by the more comprehensive `getDomainPrices` endpoint which provides pricing information for all domain operations.

**Removal Date:** 2026-01-20 (Completed)

**Client Status:**

- Ruby: [Complete](https://github.com/dnsimple/dnsimple-ruby/pull/291)
- Go: [Complete](https://github.com/dnsimple/dnsimple-go/pull/236)
- Elixir: [Complete](https://github.com/dnsimple/dnsimple-elixir/pull/304)
- Node.js: [Complete](https://github.com/dnsimple/dnsimple-node/pull/263)
- Java: [Complete](https://github.com/dnsimple/dnsimple-java/pull/230)
- C#: [Complete](https://github.com/dnsimple/dnsimple-csharp/pull/51)
- PHP: [Complete](https://github.com/dnsimple/dnsimple-php/pull/146)
- Python: [Complete](https://github.com/dnsimple/dnsimple-python/pull/483)
- Rust: [Complete](https://github.com/dnsimple/dnsimple-rust/pull/86)

### 2022-05-17 - Certificate contact_id field

The `contact_id` field in Certificate schema has been deprecated. It is no longer a required field for certificate operations and its value is ignored on input.

**Removal Date:** 2026-04-16

**Replacement:** None. This field is no longer required.

**Client Status:**

- Ruby: In progress
- Go: In progress
- Elixir: In progress
- Node.js: In progress
- Java: Complete
- C#: In progress
- PHP: In progress
- Python: In progress
- Rust: In progress

### 2021-01-25 - Email forwarding `from` field

The `from` field in Email Forward schema has been renamed to `alias_email` for clarity. The server stopped emitting the field on responses on 2026-02-24 and stopped accepting it as input on 2026-03-03. Clients that still expose `from` will see it as null/unset.

**Removal Date:** 2026-03-03 (Completed)

**Replacement:** Use `alias_email` instead.

**Client Status:**

- Ruby: Complete
- Go: Complete
- Elixir: Flagged (still present in `EmailForward` defstruct)
- Node.js: Complete
- Java: Complete
- C#: Complete
- PHP: Flagged (still exposed as `$from` on the `EmailForward` struct)
- Python: Complete
- Rust: Complete

### 2021-01-25 - Email forwarding `to` field

The `to` field in Email Forward schema has been renamed to `destination_email` for clarity. The server stopped emitting the field on responses on 2026-02-24 and stopped accepting it as input on 2026-03-03. Clients that still expose `to` will see it as null/unset.

**Removal Date:** 2026-03-03 (Completed)

**Replacement:** Use `destination_email` instead.

**Client Status:**

- Ruby: Complete
- Go: Complete
- Elixir: Flagged (still present in `EmailForward` defstruct)
- Node.js: Complete
- Java: Complete
- C#: Complete
- PHP: Flagged (still exposed as `$to` on the `EmailForward` struct)
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

### 2025-03-19 - DomainCollaborators endpoints

The `/domains/:domain/collaborators` endpoints (list, add, remove) have been removed. The server returns HTTP 410 Gone for all collaborator endpoints.

**Removal Date:** 2025-03-19 (Completed)

**Replacement:** Use the Domain Access Control feature.

**Client Status:**

- Ruby: [Complete](https://github.com/dnsimple/dnsimple-ruby/pull/430) (11.0.0)
- Go: Complete (5.0.0)
- Elixir: [Complete](https://github.com/dnsimple/dnsimple-elixir/pull/285) (7.0.0)
- Node.js: Complete (10.0.0)
- Java: Complete (3.0.0)
- C#: [Complete](https://github.com/dnsimple/dnsimple-csharp/pull/182) (0.20.0)
- PHP: Complete (4.0.0)
- Python: Complete (5.0.0)
- Rust: Complete (3.0.0)

### 2025-11-13 - Domain push `new_account_email` field

The `new_account_email` field in Domain Push request has been deprecated in favor of `new_account_identifier`, which provides more flexibility in identifying the target account.

**Removal Date:** N/A

**Replacement:** Use `new_account_identifier` instead.

**Client Status:**

- Ruby: [Flagged](https://github.com/dnsimple/dnsimple-ruby/pull/462)
- Go: [Flagged](https://github.com/dnsimple/dnsimple-go/pull/250) (8.3.0)
- Elixir: [Flagged](https://github.com/dnsimple/dnsimple-elixir/pull/324)
- Node.js: [Flagged](https://github.com/dnsimple/dnsimple-node/pull/280)
- Java: [Flagged](https://github.com/dnsimple/dnsimple-java/pull/243)
- C#: [Flagged](https://github.com/dnsimple/dnsimple-csharp/pull/230) (1.3.0)
- PHP: [Flagged](https://github.com/dnsimple/dnsimple-php/pull/161)
- Python: [Flagged](https://github.com/dnsimple/dnsimple-python/pull/497)
- Rust: [Flagged](https://github.com/dnsimple/dnsimple-rust/pull/102) (5.3.0)

## Status Legend

- **Not started** - Deprecation not yet addressed in client
- **Flagged** - Deprecation endpoints are flagged in the client code
- **In progress** - Work has begun on updating the client
- **Complete** - Client has been updated with replacement
- **N/A** - Not applicable to this client
