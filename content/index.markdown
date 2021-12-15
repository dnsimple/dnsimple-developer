---
title: DNSimple Developer
---

# DNSimple Developer Documentation

Welcome to the official [DNSimple](https://dnsimple.com/) Developer documentation.

DNSimple provides DNS hosting and domain registration that is simple and friendly. We provide an extensive API and an easy-to-use web interface so you can get your domain registered and set up with a minimal amount of effort. The complete definition of our API is available in OpenAPIv3 [YAML](/v2/openapi.yml) and [JSON](/v2/openapi.json) formats.

## Core Concepts

The core concepts in DNSimple are:

- [Accounts](#accounts)
- [Domains and Zones](#domains-and-zones)
- [SSL Certificates](#ssl-certificates)
- [Contacts](#contacts)

### Accounts

All data that you have access to in DNSimple is tied back to accounts. When you log into DNSimple, you log in as a user, but users may have access to multiple accounts. For example, you could have an account for your personal domain, and an account for your work domains. Each account has payment details associated with it and each is billed independently based on the current subscription plan.

In most cases, you will access the API using an account access token. Details on getting your account token are available in the [authentication section](/v2/#authentication) of the API documentation.

If you are using a user access token, you will have the same level of access as defined by your role for the given account (see [Domain Access Control](https://support.dnsimple.com/articles/domain-access-control/)). A Zone Operator will have access to a zone and its records, but not other parts of the domain. Likewise, a Domain Manager will only be able to see the domains they are permitted to see.

### Domains and Zones

Accounts hold 0 or more domains. Each domain represents a single domain name as well as details about the domain name, such as whether it is registered with DNSimple or just hosted. For domains that are registered, the domain includes details about its registrant, whois privacy status, expiration date and more. Domains may have collections of other entities associated with them, such as SSL certificates, email forwards, collaborators, etc.

Zones represent the DNS zone for a domain. Each domain MUST have a zone, however zones may also exist without a domain (in the case of a reverse zone, which is used to provide reverse DNS). Zones have 1 or more records. All zones will have a combination of system records, which are records that we automatically create, such as SOA and NS records, as well as custom records, which are records created by users. If you'd like to read more about DNS zones and the records we support, visit the [DNS section](https://support.dnsimple.com/categories/dns/) of the DNSimple support site.

### SSL Certificates

SSL certificates are always referenced through the domain they are attached to. Whenever you want to request an SSL certificate, you must first have the domain in your DNSimple account. The domain could be hosted or registered.

### Contacts

Accounts hold 0 or more contacts. Contacts are used when registering domains as well as when requesting SSL certificates. When you create a contact you will be able to use it across as many domains and SSL certificates as you would like. When you change a contact's information, that change may also be applied across registered domains, if necessary.

## API Documentation

The DNSimple API is a REST web service API that provides access to domains, zones, records, SSL certificates and other entities in DNSimple accounts.

The current version is [API v2](/v2/).
