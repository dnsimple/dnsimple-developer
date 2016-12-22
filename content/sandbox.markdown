---
title: Sandbox
excerpt: Welcome to DNSimple. This page explains our sandbox environment. Enjoy low cost hosted DNS services, an easy to use web interface, and REST API.
---

# Sandbox

* TOC
{:toc}

---

We maintain an isolated test site at [sandbox.dnsimple.com](https://sandbox.dnsimple.com/). Please feel invited to test your applications that integrate with the DNSimple API here.

### Disclaimer

Sandbox data and systems are generally treated like production, however we may not apply the same backup, monitoring and high availability policies. That means we may occasionally need to take this environment down, wipe out a portion, or clear all stored data.

## Getting started

The DNSimple sandbox is a independent system, you have to create another account and register some domains to test your integrations. *Every action within the Sandbox will be free of charge*

- Go to [sandbox.dnsimple.com/signup](https://sandbox.dnsimple.com/signup) and register your account. _It does not have to match your DNSimple live account._
- When asked to choose a plan choose `Skip this step and choose a plan later` at the bottom. If you want to test features that requires a valid subscription please refer to the [Testing Subscriptions](#testing-subscriptions) section.

### URL

The API hostname is `api.sandbox.dnsimple.com`. This hostname follows the same [URL and version](/overview/#url) conventions of the production environment.

### Sandboxing 3rd parties

This site is generally an exact duplicate of the production application, but there are some exceptions. Instead of actually performing domain registration, charging credit cards, etc. it _mocks_ these functions.


## Testing Domains

To register domains with your sandbox account you will need an active subscription ([see below](#testing-subscriptions)). You can register every domain you want, as long as it's available because you are still sharing a system with other customers.

*Domains you register within the sandbox will not resolve*


## Testing Subscriptions

To test mock registration or other subscription-based features you will have to create a test account.

When entering the credit card details:

- Use the credit card number `1` to simulate a credit card in good status. All payments and authorizations will succeed.
- Use the credit card number `3` to simulate a credit card in which all authorizations and payments will fail.

## Testing Two Factor Authentication

To test 2FA integration use the following OTP tokens:

- `0000000` will pass 2FA
- any other token will fail 2FA
