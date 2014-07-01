---
title: Planned Changes
---

# Planned Changes

These changes are not implemented yet, however they are planned and will likely be introduced in the current API version.

We hate to break backward compatibility, however there are cases where a method was not properly documented and a bug or inconsistent choice has been adopted as standard.

Please review the following changes and write your code accordingly. In most cases, you should be able to support both current and planned API response by loosening validation checks. For example, you can check whether the response code of a delete is `2xx` and you'll match both `200` (current) and `204` (planned).


## Serialization changes

### Domain serialization

- `name_server_status` is deprecated and will be removed.
- `private_whois?` is deprecated and will be removed, use `whois_protected` instead.
- `parsed_expiration_date` is deprecated and will be removed, use `expires_on` instead.
- `expires_at` is deprecated and will be removed.

### Certificate serialization

- `name_server_status` is deprecated and will be removed. Use `approver_emails` instead (the field is displayed only when the certificate is in the `configured` state).
- `certificate_status` is deprecated and will be removed.

### User serialization

- `first_name` is deprecated and will be removed.
- `last_name` is deprecated and will be removed.


## Method changes

### DELETE /domains/:domain

- Response code is expected to HTTP 204 instead of HTTP 200.
- Response is expected to be empty instead of a JSON object.

### DELETE /domains/:domain/records/:id

- Response code is expected to HTTP 204 instead of HTTP 200.

### DELETE /domains/:domain/whois_privacy

- Response code is expected to HTTP 204 instead of HTTP 200.
- Response is expected to be empty instead of a JSON object.
