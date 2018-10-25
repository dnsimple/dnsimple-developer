---
title: Sandbox Environment
excerpt: We maintain an isolated test site, we highly recommend testing against our sandbox environment before using our production environment.
---

# Sandbox Environment

* TOC
{:toc}

---

We maintain an isolated test site at [sandbox.dnsimple.com](https://sandbox.dnsimple.com/). We highly recommend testing against our [sandbox environment](https://developer.dnsimple.com/sandbox/) before using our production environment. This will allow you to avoid real purchases, live charges on your credit card, and reduce the chance of your running up against rate limits.

### Disclaimer

Sandbox data and systems are generally treated like production, however we may not apply the same backup, monitoring and high availability policies. That means we may occasionally need to take this environment down, wipe out a portion, or clear all stored data.

## Getting started

The DNSimple sandbox is a independent system, you have to create another account and register some domains to test your integrations. 

<callout>
Every action within the Sandbox will be free of charge.
</callout>

- Go to [sandbox.dnsimple.com/signup](https://sandbox.dnsimple.com/signup) and register your account. _It does not have to match your DNSimple live account._
- When asked to choose a plan choose `Skip this step and choose a plan later` at the bottom. If you want to test features that requires a valid subscription, including registering test domains, please refer to the [Testing Subscriptions](#testing-subscriptions) section.

### URL

The API hostname is `api.sandbox.dnsimple.com`. This hostname follows the same [URL and version](/overview/#url) conventions of the production environment.

### Sandboxing 3rd parties

This site is generally an exact duplicate of the production application, but there are some exceptions. Instead of actually performing domain registration, charging credit cards, etc. it _mocks_ these functions.


## Testing Domains

To register domains with your sandbox account you will need an active subscription ([see below](#testing-subscriptions)). You can register every domain you want, as long as it's available because you are still sharing a system with other customers.

<callout>
Domains you register within the sandbox will not have any DNS service.
</callout>


## Testing Certificates

Testing working with certificates is at the moment *not supported* within the sandbox because certificate validation requires actual DNS service.


## Testing Subscriptions

To test domain registrations or other subscription-based features you will have to subscribe to a plan.

When entering the credit card details:

- Use the credit card number `4242 4242 4242 4242` to simulate a credit card in good status. All payments and authorizations will succeed.
- Use the credit card number `4000 0000 0000 0341` to simulate a credit card in which all authorizations and payments will fail.
