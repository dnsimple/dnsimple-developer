---
title: Dynamic DNS Shell Script
excerpt: Set up Dynamic DNS with DDNS.horse or a simple shell script using our REST API.
---

## What is Dynamic DNS?

While many production environments are able to obtain static IP addresses, you may want to provide access to a device with a dynamic IP address. Dynamic DNS services provide the ability to update the DNS record for a given device automatically.

The script below can be customized and run on a schedule from a tool, like cron. Alternatively, take a look at [DDNS.horse](https://ddns.horse/), an external DDNS service built by one of the DNSimple team members. It works directly with DNSimple using OAuth and the DNSimple API.

## Dynamic DNS Shell Script

~~~bash
#!/bin/bash

TOKEN="your-oauth-token"  # The API v2 OAuth token
ACCOUNT_ID="12345"        # Replace with your account ID
ZONE_ID="yourdomain.com"  # The zone ID is the name of the zone (or domain)
RECORD_ID="1234567"       # Replace with the Record ID
IP=`curl --ipv4 -s http://icanhazip.com/`

curl -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     -H "Accept: application/json" \
     -X "PATCH" \
     -i "https://api.dnsimple.com/v2/$ACCOUNT_ID/zones/$ZONE_ID/records/$RECORD_ID" \
     -d "{\"content\":\"$IP\"}"
~~~

Download the shell script: [ddns.sh](ddns.sh)
