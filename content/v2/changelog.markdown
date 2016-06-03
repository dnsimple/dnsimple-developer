---
title: Changelog | DNSimple API v2 (Beta)
excerpt: History of the changes to the API v2.
---

# Changelog

API v2 are currently in beta, and they are in active development. As part of the beta, we may introduce some changes to the API methods, serialized responses or signatures.

This page lists all the changes since API v2 were announced in public beta. If you use our official API clients, in most cases the changes are taken care for you.

2016-06-03
: Removed support for the _Wildcard Account_. The wildcard account was a special character `_` you can pass in some API requests instead of a real account, and our system tried to detect the account for you. Using a wildcard is currently no longer supported, a real account ID has to be provided.
