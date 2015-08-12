---
title: Planned Changes
excerpt: This page documents the planned changes to the DNSimple API v1.
---

# Planned Changes

These changes are not implemented yet, however they are planned and will likely be introduced in the current API version.

We hate to break backward compatibility, however there are cases where a method was not properly documented and a bug or inconsistent choice has been adopted as standard.

Please review the following changes and write your code accordingly. In most cases, you should be able to support both current and planned API response by loosening validation checks. For example, you can check whether the response code of a delete is `2xx` and you'll match both `200` (current) and `204` (planned).


## Method changes

### DELETE /domains/:domain

- Response code is expected to HTTP 204 instead of HTTP 200.
- Response is expected to be empty instead of a JSON object.

### DELETE /domains/:domain/records/:id

- Response code is expected to HTTP 204 instead of HTTP 200.
