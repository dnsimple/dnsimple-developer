---
title: Sandbox
---

# Sandbox

* TOC
{:toc}

---

We maintains an isolated test site at [sandbox.dnsimple.com](https://sandbox.dnsimple.com/). Please feel free to test your experience and any application code that integrates with the DNSimple API here.

<note>
Sandbox data and systems are generally treated like production, however we apply loosen backup, monitoring and high availability policies. That means we may occasionally need to take this environment down, wipe out a portion or the entire stored data.
</note>

## URL

The API hostname is `api.sandbox.dnsimple.com`. This hostname follows the same [URL and version](/overview/#url) conventions of the production environment.

## Special Settings

This site is generally an exact duplicate of the production application. Instead of actually performing domain registration, charging credit cards, etc. it mocks these functions.

### Testing Subscriptions

To test mock registration or other subscription-based features you will have to create a test account.
When entering the credit card details:

- Use the credit card number `1` to simulate a credit card in good status. All payments and authorizations will succeed.
- Use the credit card number `3` to simulate a credit card in which all authorizations and payments will fail.

### Testing Two Factor Authentication

To test 2FA integration use the following OTP tokens:

- `0000000` will pass 2FA
- any other token will fail 2FA
