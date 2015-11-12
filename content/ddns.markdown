---
title: Dynamic DNS Shell Script
excerpt: Set up Dynamic DNS with this simple shell script using our REST API.
---

## What is Dynamic DNS?

While many production environments are able to obtain static IP addresses, there is sometimes a need to access a device with a dynamic address over the internet. Dynamic DNS services provide the ability to update the DNS record for a given device automatically.

Some DNS providers offer a proprietary tool to accomplish this and others even specialize as dynamic DNS providers. With DNSimple, it's possible to have simple dynamic DNS service for a specific record by customizing the script below to your needs and running it on the schedule you choose.

## Dynamic DNS Shell Script

~~~bash
#!/bin/bash
 
LOGIN="your@email"
TOKEN="your-api-token"
DOMAIN_ID="yourdomain.com"
RECORD_ID="12345" # Replace with the Record ID
IP=`curl -s http://icanhazip.com/`
 
curl -H "Accept: application/json" \
     -H "Content-Type: application/json" \
     -H "X-DNSimple-Token: $LOGIN:$TOKEN" \
     -X "PUT" \
     -i "https://api.dnsimple.com/v1/domains/$DOMAIN_ID/records/$RECORD_ID" \
     -d "{\"record\":{\"content\":\"$IP\"}}"
~~~

Download the shell script: [ddns.sh](ddns.sh)
