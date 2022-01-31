---
title: Tools
excerpt: Tools built around the DNSimple Domain and DNS API.
---

# Tools

* TOC
{:toc}


## DNSimple tools

### [DNSimple Slack integration](https://dnsimple.com/slack)

With the official DNSimple Stack integration you can buy, connect, and operate your domains directly from your Slack channel.

<small>
[homepage](https://dnsimple.com/slack) &bull;
[documentation](https://support.dnsimple.com/articles/slack-integration/) &bull;
[announcement](https://blog.dnsimple.com/2016/05/introducing-the-slack-app/)
</small>

### [Strillone](https://github.com/dnsimple/strillone)

Strillone is a service to publish the events generated from a DNSimple account to a messaging service (such as Slack), using the [DNSimple webhooks](https://dnsimple.com/webhooks).

<small>
[source code](https://github.com/dnsimple/strillone) &bull;
[announcement](https://blog.dnsimple.com/2016/03/dnsimple-strillone/)
</small>

### [Chef Cookbook for DNSimple](https://supermarket.chef.io/cookbooks/dnsimple)

Provides Chef LWRP for automating DNS configuration with DNSimple.

<small>
[homepage](https://supermarket.chef.io/cookbooks/dnsimple)
</small>

### [DNSimple Terraform Provider]()

With the official DNSimple Terraform provider you can manage your DNS like your other cloud services.

<small>
[documentation](https://support.dnsimple.com/articles/terraform-provider/) &bull;
[source code](https://github.com/dnsimple/terraform-provider-dnsimple) &bull;
[announcement](https://blog.dnsimple.com/2021/12/introducing-dnsimple-terraform-provider/)
</small>


## Community-developed tools

- [Import tool in Ruby](https://github.com/aetrion/dnsimple-importer)
- [Dynamic IP Updater in Bash](/ddns) (official)
- [Dynamic IP Updater in Bash](http://jasonseifer.com/2011/04/04/auto-update-ip-dnsimple) (original by [Jason Seifer](http://jasonseifer.com)
- [Dynamic IP Updater in Ruby](https://github.com/hamstarr/dyn-dnsimple) by [hamstarr](https://github.com/hamstarr)
- [Dynamic IP Updater in Ruby](https://github.com/bjoernalbers/dynsimple) by [bjoernalbers](https://github.com/bjoernalbers)
- [Dynamic IP Updater in Node.js](https://github.com/jcarley/node-dns) by [jcarley](https://github.com/jcarley)
- [Dynamic IP Updater for Windows](https://github.com/dwdii/DNScymbal) by [dwdii](https://github.com/dwdii)
- [Dynamic IP Updater in Golang](https://github.com/jcarley/go-dns) by [jcarley](https://github.com/jcarley)
- [DitchDaddy](https://github.com/jm/ditchdaddy) - for batch transferring domains out of GoDaddy by [jm](https://github.com/jm)
- [Screw You Zerigo](https://gist.github.com/bhauman/8225787) - for moving zones from Zerigo to DNSimple by [bhauman](https://gist.github.com/bhauman)
- [record_store](https://github.com/Shopify/record_store) - Shopify's tool for controlling your records from a git-repo based workflow
- [dnscontrol](https://github.com/StackExchange/dnscontrol) - StackExchange's tool to Synchronize your DNS to multiple providers from a simple DSL
- [dnsimple-batch](https://github.com/widepath/dnsimple-batch) - Make bulk updates to your domains/records at DNSimple.


If you've developed a tool for the API, [please let us know](https://dnsimple.com/contact) so we can add it here.
Also, make sure to [check out the libraries](https://developer.dnsimple.com/libraries) you can use to build your own tools around our API.
