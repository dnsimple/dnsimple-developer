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

The DNSimple Sandbox is independent from the DNSimple production site, you have to create another account and register some domains to test your integrations.

<info>
Every action within the Sandbox will be free of charge.
</info>

- Go to [sandbox.dnsimple.com/signup](https://sandbox.dnsimple.com/signup) and register your account. _It does not have to match your DNSimple live account._
- Choose a plan that [matches the features that you'd like to test](https://sandbox.dnsimple.com/pricing). Please refer to the [Testing Subscriptions](#testing-subscriptions) section for payment information.

### URL

The API hostname is `api.sandbox.dnsimple.com`. This hostname follows the same [URL and version](/v2/#url) conventions of the production environment.

### Sandboxing 3rd parties

This site is generally an exact duplicate of the production application, but there are some exceptions. Instead of actually performing domain registration, charging credit cards, etc. it _mocks_ these functions.


## Testing Zones and DNS

In the Sandbox environment, you can add as many DNS zones and DNS records as you would in the production environment. This is useful for testing your API integrations, record formats, and automation workflows.

However, please note that there is no public authoritative name server in the Sandbox. As a result, any zones or records you create will not publicly resolve.


## Testing Domains

To register domains with your sandbox account you will need an active subscription ([see below](#testing-subscriptions)). You can register every domain you want, as long as it's available because you are still sharing a system with other customers.

<note>
Domain registration and all other domain-related actions in the Sandbox are performed against the registry OT&E (Operational Test and Evaluation) environments, not the live production registries. This means that the domains you see or register in the Sandbox do not reflect the real-world status of domain registrations. You can test availability checks, registrations, transfers, and other domain operations as you would in production, but please do not assume that a domain registered in the real world is registered in Sandbox, or vice-versa.
</note>

## Testing Certificates

Testing working with certificates is at the moment *not supported* within the sandbox because certificate validation requires actual DNS service.


## Testing Subscriptions

To test domain registrations or other subscription-based features you will have to subscribe to a plan.

We use Stripe as our payment gateway, so [their testing documentation](https://stripe.com/docs/testing) may be relevant depending on your use case.

You can use any of [the documented cards](https://stripe.com/docs/testing#cards) to make payments to succeed or fail at your convenience. Here are the 2 credit card numbers that we most frequently use:

- `4242 4242 4242 4242`: Use this credit card number to **make all payments and authorizations succeed**.
- `4000 0000 0000 0341`: Use this credit card number to **make all payments and authorizations fail**.
