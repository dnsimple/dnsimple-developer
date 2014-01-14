---
title: SSL Certificates
---

# Certificate API

Purchase and manage SSL certificates.

* TOC
{:toc}


## List domain certificates

    GET /domains/:domain/certificates

### Parameters

| Name | Type | Description |
| -----|------|-------------|
`:domain` | `string`, `integer` | The domain name or id

### Example

List certificates for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/example.com/certificates

### Response

~~~ js
[
  {
    "certificate": {
      "id": 2,
      "domain_id": 1,
      "contact_id": 100,
      "name": "www",
      "state": "issued",
      "csr": "-----BEGIN NEW CERTIFICATE REQUEST-----
      MIIC0DCCAbgCAQAwWzELMAkGA1UEBhMCVVMxFTATBgNVBAoTDEFudGhvbnkgRWRl
      bjEOMAwGA1UEBxMFTWlhbWkxCzAJBgNVBAgTAkZMMRgwFgYDVQQDEw93d3cuZXhh
      bXBsZS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCtW/z7avuO
      CrvfRBYkqJt+2w8YlivjMrUTOJT2DQdqXTnOgqnOeL4+Jdey9BBaJRQS+HhPLkJN
      rBmv9uDOEzQBAfm3POP/2Cg6ZvDren+fZuziq+FRopxDiaDupnWgVxCAzxu9wzOb
      dXQW5dB0BnrtPsclYhPwgSMIhxaCbeJSIDP1WveCZzRyLIthg6ajOMsKILKJ+TQg
      K64dpV4LGU5uLUrYHCMMatQ5OZ+N1PKL3nPLSKEHtLnYxKDoX3em5tRz7pc4JsIC
      UFOIRIuQr7Gdp9sH9fHVwcvZL5q1Ykz83rWKHAhu2vBL04n3EYFLYlA9NzPO23Zj
      GkWYafsn1gu9AgMBAAGgMDAuBgkqhkiG9w0BCQ4xITAfMAwGA1UdEwEB/wQCMAAw
      DwYDVR0PAQH/BAUDAweAADANBgkqhkiG9w0BAQUFAAOCAQEAgl4cBmVFpbl1Y1iD
      H6xPeRaT60jp2pPi3pwE7jTw6oqTSqCuH9EAvG2FopUlV7Jz10I8w7Cts2fwgayr
      h6MnSTUv1Nep6pEKrQaOYbAmwioTEZaNyzRwQVy6geKcz0PZeVFHm7Hs57WTJQiR
      bpm0sc/Rhu9h19y14KRlfWUwQU8rM8biJSGJhIpJ9TqtxMcKgswYKV8L6pt4ZvKM
      /IuGxTqSv4pJagzSCbww+8uyKfscOMnEUkkFOE2/kK+Bf+EdAy2rKLJDqPRc1Yeb
      WUf0sRMLu6e50I140w2YYIyyKR10KHP6PQmr+Fz9DxEmjgAY7BWOLS3TSwqCm0Ek
      t0evlw==
      -----END NEW CERTIFICATE REQUEST-----",
      "ssl_certificate": null,
      "private_key": "-----BEGIN RSA PRIVATE KEY-----
      MIIEogIBAAKCAQEArVv8+2r7jgq730QWJKibftsPGJYr4zK1EziU9g0Hal05zoKp
      zni+PiXXsvQQWiUUEvh4Ty5CTawZr/bgzhM0AQH5tzzj/9goOmbw63p/n2bs4qvh
      UaKcQ4mg7qZ1oFcQgM8bvcMzm3V0FuXQdAZ67T7HJWIT8IEjCIcWgm3iUiAz9Vr3
      gmc0ciyLYYOmozjLCiCyifk0ICuuHaVeCxlObi1K2BwjDGrUOTmfjdTyi95zy0ih
      B7S52MSg6F93pubUc+6XOCbCAlBTiESLkK+xnafbB/Xx1cHL2S+atWJM/N61ihwI
      btrwS9OJ9xGBS2JQPTczztt2YxpFmGn7J9YLvQIDAQABAoIBAADxEvq6pgsre8HG
      uOgSEmYqAnb7udlOGTW1hPmhMH0fbIT2qL16Ym4r/nP2Z3BV6zn/J4gmlC2f1bPi
      /22fJRUsUZLxPbvSDMXkcUKWM8NF59uDW4H6BCdJxBoHxXPNhUVt2pS5Trp1dN/6
      95rpvhkz0hkd40XXLb2KHlEvD5+qktOU7xg7R7aRATg6KtEpSxDqKwNy5o3+YVAe
      Z+nhYCevKboshMuJFx7OJ0zvn3gYU7/85RI9Zn4ofqUjFzZl6PPHmb6xn5v1v6+5
      t9gp19FF1MbMFpnKnsbR/2jm5xX3BVo5PofM2Xx04hThCi9pno/JApdJ95nOzmuK
      bQT9YIECgYEAzW2KugAoN0JwhlGc9pIcZ1OyM9YYAN4KHCVlaFIIfWD1PoP1uieV
      EIsGb9bworQgItXi6SwFnw+i9eRZI70Hmx+Y8SSY9IDtiI1nY5W71H9+9CJS/foc
      zDbmYclR/1e91MVwAVJDScECCuic9NUfxjaZDKChRPifKCXBG0wRGjUCgYEA2Als
      hJSsVQby00b+YuMCVp6IbyhvlGm6hKrKAQXNMhZWrHIs52qrlbuqeyfYg9IjGhSS
      +qNBRj/KzFvx8QuU55M3ydHZzz5Ah8MzwfP8gbVsdkPvnDbPvHDUkAFpewsp/4OG
      F5559iRwv/JStGgEtwnNV91JX5mmGOI7KxCynGkCgYAdlwnEgQFJ9GgA8QCLA8DT
      oVqp3MzYUyNhqoFQ5YATj0PEHX3nsovmNiBXO76tsQRwAB8PNygYIUh34sx0OWY/
      Ee4Vzg+6KFgOs0+RKKBFm5fN0qPhsYU0ZTQKIdWN0jWl0Eqx5geLOCHzME5rdcd9
      5Z9mEj0okidawRVvuSU9gQKBgDh7DkIDVKLONEIEd5GG5B+dRvI40iMtGTSCKlnm
      GGWV7YccOp0uCDoXXFTib/rWv5Kb+mlIsVIab3zKNRDeBEoe9SDwmk9SaTCVWjzE
      +yk2M2sgC879jYYowYn8tIUUwCArVK1sI1q04D1uryy3XTQ1fdgQ5JP36bLrwqhZ
      rzixAoGAbcOK7v+IUHamcWJb8kkAsrIxjAGE/CNLYiZTeSTbTegZFb9KcpNzojJT
      ClvuFGYh3Rb35NMC9XIvJbAfWBv1XB+TX+o41YcS8H3AocQtuxmxNqYzZOvUpAkM
      oWo54arDcDjcPm2TYZ0umKl/CacGYTwfUpA42BEpoxx+RcF7/XU=
      -----END RSA PRIVATE KEY-----",
      "approver_email": "admin@example.com",
      "created_at": "2011-05-14T15:14:43Z",
      "updated_at": "2011-05-14T15:14:43Z",
      "configured_at": "2011-05-14T15:14:43Z",
      "expires_on": "2012-05-14"
    }
  },
  {
    "certificate": {
      "id": 22,
      "domain_id": 1,
      "contact_id": 100,
      "name": "ww1",
      "state": "purchased",
      "csr": "-----BEGIN NEW CERTIFICATE REQUEST-----
      MIIC0DCCAbgCAQAwWzELMAkGA1UEBhMCVVMxFTATBgNVBAoTDEFudGhvbnkgRWRl
      bjEOMAwGA1UEBxMFTWlhbWkxCzAJBgNVBAgTAkZMMRgwFgYDVQQDEw93d3cuZXhh
      bXBsZS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCtW/z7avuO
      CrvfRBYkqJt+2w8YlivjMrUTOJT2DQdqXTnOgqnOeL4+Jdey9BBaJRQS+HhPLkJN
      rBmv9uDOEzQBAfm3POP/2Cg6ZvDren+fZuziq+FRopxDiaDupnWgVxCAzxu9wzOb
      dXQW5dB0BnrtPsclYhPwgSMIhxaCbeJSIDP1WveCZzRyLIthg6ajOMsKILKJ+TQg
      K64dpV4LGU5uLUrYHCMMatQ5OZ+N1PKL3nPLSKEHtLnYxKDoX3em5tRz7pc4JsIC
      UFOIRIuQr7Gdp9sH9fHVwcvZL5q1Ykz83rWKHAhu2vBL04n3EYFLYlA9NzPO23Zj
      GkWYafsn1gu9AgMBAAGgMDAuBgkqhkiG9w0BCQ4xITAfMAwGA1UdEwEB/wQCMAAw
      DwYDVR0PAQH/BAUDAweAADANBgkqhkiG9w0BAQUFAAOCAQEAgl4cBmVFpbl1Y1iD
      H6xPeRaT60jp2pPi3pwE7jTw6oqTSqCuH9EAvG2FopUlV7Jz10I8w7Cts2fwgayr
      h6MnSTUv1Nep6pEKrQaOYbAmwioTEZaNyzRwQVy6geKcz0PZeVFHm7Hs57WTJQiR
      bpm0sc/Rhu9h19y14KRlfWUwQU8rM8biJSGJhIpJ9TqtxMcKgswYKV8L6pt4ZvKM
      /IuGxTqSv4pJagzSCbww+8uyKfscOMnEUkkFOE2/kK+Bf+EdAy2rKLJDqPRc1Yeb
      WUf0sRMLu6e50I140w2YYIyyKR10KHP6PQmr+Fz9DxEmjgAY7BWOLS3TSwqCm0Ek
      t0evlw==
      -----END NEW CERTIFICATE REQUEST-----",
      "ssl_certificate": null,
      "private_key": "-----BEGIN RSA PRIVATE KEY-----
      MIIEogIBAAKCAQEArVv8+2r7jgq730QWJKibftsPGJYr4zK1EziU9g0Hal05zoKp
      zni+PiXXsvQQWiUUEvh4Ty5CTawZr/bgzhM0AQH5tzzj/9goOmbw63p/n2bs4qvh
      UaKcQ4mg7qZ1oFcQgM8bvcMzm3V0FuXQdAZ67T7HJWIT8IEjCIcWgm3iUiAz9Vr3
      gmc0ciyLYYOmozjLCiCyifk0ICuuHaVeCxlObi1K2BwjDGrUOTmfjdTyi95zy0ih
      B7S52MSg6F93pubUc+6XOCbCAlBTiESLkK+xnafbB/Xx1cHL2S+atWJM/N61ihwI
      btrwS9OJ9xGBS2JQPTczztt2YxpFmGn7J9YLvQIDAQABAoIBAADxEvq6pgsre8HG
      uOgSEmYqAnb7udlOGTW1hPmhMH0fbIT2qL16Ym4r/nP2Z3BV6zn/J4gmlC2f1bPi
      /22fJRUsUZLxPbvSDMXkcUKWM8NF59uDW4H6BCdJxBoHxXPNhUVt2pS5Trp1dN/6
      95rpvhkz0hkd40XXLb2KHlEvD5+qktOU7xg7R7aRATg6KtEpSxDqKwNy5o3+YVAe
      Z+nhYCevKboshMuJFx7OJ0zvn3gYU7/85RI9Zn4ofqUjFzZl6PPHmb6xn5v1v6+5
      t9gp19FF1MbMFpnKnsbR/2jm5xX3BVo5PofM2Xx04hThCi9pno/JApdJ95nOzmuK
      bQT9YIECgYEAzW2KugAoN0JwhlGc9pIcZ1OyM9YYAN4KHCVlaFIIfWD1PoP1uieV
      EIsGb9bworQgItXi6SwFnw+i9eRZI70Hmx+Y8SSY9IDtiI1nY5W71H9+9CJS/foc
      zDbmYclR/1e91MVwAVJDScECCuic9NUfxjaZDKChRPifKCXBG0wRGjUCgYEA2Als
      hJSsVQby00b+YuMCVp6IbyhvlGm6hKrKAQXNMhZWrHIs52qrlbuqeyfYg9IjGhSS
      +qNBRj/KzFvx8QuU55M3ydHZzz5Ah8MzwfP8gbVsdkPvnDbPvHDUkAFpewsp/4OG
      F5559iRwv/JStGgEtwnNV91JX5mmGOI7KxCynGkCgYAdlwnEgQFJ9GgA8QCLA8DT
      oVqp3MzYUyNhqoFQ5YATj0PEHX3nsovmNiBXO76tsQRwAB8PNygYIUh34sx0OWY/
      Ee4Vzg+6KFgOs0+RKKBFm5fN0qPhsYU0ZTQKIdWN0jWl0Eqx5geLOCHzME5rdcd9
      5Z9mEj0okidawRVvuSU9gQKBgDh7DkIDVKLONEIEd5GG5B+dRvI40iMtGTSCKlnm
      GGWV7YccOp0uCDoXXFTib/rWv5Kb+mlIsVIab3zKNRDeBEoe9SDwmk9SaTCVWjzE
      +yk2M2sgC879jYYowYn8tIUUwCArVK1sI1q04D1uryy3XTQ1fdgQ5JP36bLrwqhZ
      rzixAoGAbcOK7v+IUHamcWJb8kkAsrIxjAGE/CNLYiZTeSTbTegZFb9KcpNzojJT
      ClvuFGYh3Rb35NMC9XIvJbAfWBv1XB+TX+o41YcS8H3AocQtuxmxNqYzZOvUpAkM
      oWo54arDcDjcPm2TYZ0umKl/CacGYTwfUpA42BEpoxx+RcF7/XU=
      -----END RSA PRIVATE KEY-----",
      "approver_email": nil,
      "created_at": "2011-05-14T15:14:43Z",
      "updated_at": "2011-05-14T15:14:43Z",
      "configured_at": "2011-05-14T15:14:43Z",
      "expires_on": "2012-05-14"
    }
  }
]
~~~


## Get a domain certificate

    GET /domains/:domain/certificates/:id

### Parameters

| Name | Type | Description |
| -----|------|-------------|
`:domain` | `string`, `integer` | The domain name or id

:id
: The _integer_ certificate id

### Example

Get the certificate with ID `2`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v1/domains/example.com/certificates/2

### Response

~~~ js
{
  "certificate": {
    "id": 2,
    "domain_id": 1,
    "contact_id": 100,
    "name": "www",
    "state": "issued",
    "csr": "-----BEGIN NEW CERTIFICATE REQUEST-----
    MIIC0DCCAbgCAQAwWzELMAkGA1UEBhMCVVMxFTATBgNVBAoTDEFudGhvbnkgRWRl
    bjEOMAwGA1UEBxMFTWlhbWkxCzAJBgNVBAgTAkZMMRgwFgYDVQQDEw93d3cuZXhh
    bXBsZS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCtW/z7avuO
    CrvfRBYkqJt+2w8YlivjMrUTOJT2DQdqXTnOgqnOeL4+Jdey9BBaJRQS+HhPLkJN
    rBmv9uDOEzQBAfm3POP/2Cg6ZvDren+fZuziq+FRopxDiaDupnWgVxCAzxu9wzOb
    dXQW5dB0BnrtPsclYhPwgSMIhxaCbeJSIDP1WveCZzRyLIthg6ajOMsKILKJ+TQg
    K64dpV4LGU5uLUrYHCMMatQ5OZ+N1PKL3nPLSKEHtLnYxKDoX3em5tRz7pc4JsIC
    UFOIRIuQr7Gdp9sH9fHVwcvZL5q1Ykz83rWKHAhu2vBL04n3EYFLYlA9NzPO23Zj
    GkWYafsn1gu9AgMBAAGgMDAuBgkqhkiG9w0BCQ4xITAfMAwGA1UdEwEB/wQCMAAw
    DwYDVR0PAQH/BAUDAweAADANBgkqhkiG9w0BAQUFAAOCAQEAgl4cBmVFpbl1Y1iD
    H6xPeRaT60jp2pPi3pwE7jTw6oqTSqCuH9EAvG2FopUlV7Jz10I8w7Cts2fwgayr
    h6MnSTUv1Nep6pEKrQaOYbAmwioTEZaNyzRwQVy6geKcz0PZeVFHm7Hs57WTJQiR
    bpm0sc/Rhu9h19y14KRlfWUwQU8rM8biJSGJhIpJ9TqtxMcKgswYKV8L6pt4ZvKM
    /IuGxTqSv4pJagzSCbww+8uyKfscOMnEUkkFOE2/kK+Bf+EdAy2rKLJDqPRc1Yeb
    WUf0sRMLu6e50I140w2YYIyyKR10KHP6PQmr+Fz9DxEmjgAY7BWOLS3TSwqCm0Ek
    t0evlw==
    -----END NEW CERTIFICATE REQUEST-----",
    "ssl_certificate": null,
    "private_key": "-----BEGIN RSA PRIVATE KEY-----
    MIIEogIBAAKCAQEArVv8+2r7jgq730QWJKibftsPGJYr4zK1EziU9g0Hal05zoKp
    zni+PiXXsvQQWiUUEvh4Ty5CTawZr/bgzhM0AQH5tzzj/9goOmbw63p/n2bs4qvh
    UaKcQ4mg7qZ1oFcQgM8bvcMzm3V0FuXQdAZ67T7HJWIT8IEjCIcWgm3iUiAz9Vr3
    gmc0ciyLYYOmozjLCiCyifk0ICuuHaVeCxlObi1K2BwjDGrUOTmfjdTyi95zy0ih
    B7S52MSg6F93pubUc+6XOCbCAlBTiESLkK+xnafbB/Xx1cHL2S+atWJM/N61ihwI
    btrwS9OJ9xGBS2JQPTczztt2YxpFmGn7J9YLvQIDAQABAoIBAADxEvq6pgsre8HG
    uOgSEmYqAnb7udlOGTW1hPmhMH0fbIT2qL16Ym4r/nP2Z3BV6zn/J4gmlC2f1bPi
    /22fJRUsUZLxPbvSDMXkcUKWM8NF59uDW4H6BCdJxBoHxXPNhUVt2pS5Trp1dN/6
    95rpvhkz0hkd40XXLb2KHlEvD5+qktOU7xg7R7aRATg6KtEpSxDqKwNy5o3+YVAe
    Z+nhYCevKboshMuJFx7OJ0zvn3gYU7/85RI9Zn4ofqUjFzZl6PPHmb6xn5v1v6+5
    t9gp19FF1MbMFpnKnsbR/2jm5xX3BVo5PofM2Xx04hThCi9pno/JApdJ95nOzmuK
    bQT9YIECgYEAzW2KugAoN0JwhlGc9pIcZ1OyM9YYAN4KHCVlaFIIfWD1PoP1uieV
    EIsGb9bworQgItXi6SwFnw+i9eRZI70Hmx+Y8SSY9IDtiI1nY5W71H9+9CJS/foc
    zDbmYclR/1e91MVwAVJDScECCuic9NUfxjaZDKChRPifKCXBG0wRGjUCgYEA2Als
    hJSsVQby00b+YuMCVp6IbyhvlGm6hKrKAQXNMhZWrHIs52qrlbuqeyfYg9IjGhSS
    +qNBRj/KzFvx8QuU55M3ydHZzz5Ah8MzwfP8gbVsdkPvnDbPvHDUkAFpewsp/4OG
    F5559iRwv/JStGgEtwnNV91JX5mmGOI7KxCynGkCgYAdlwnEgQFJ9GgA8QCLA8DT
    oVqp3MzYUyNhqoFQ5YATj0PEHX3nsovmNiBXO76tsQRwAB8PNygYIUh34sx0OWY/
    Ee4Vzg+6KFgOs0+RKKBFm5fN0qPhsYU0ZTQKIdWN0jWl0Eqx5geLOCHzME5rdcd9
    5Z9mEj0okidawRVvuSU9gQKBgDh7DkIDVKLONEIEd5GG5B+dRvI40iMtGTSCKlnm
    GGWV7YccOp0uCDoXXFTib/rWv5Kb+mlIsVIab3zKNRDeBEoe9SDwmk9SaTCVWjzE
    +yk2M2sgC879jYYowYn8tIUUwCArVK1sI1q04D1uryy3XTQ1fdgQ5JP36bLrwqhZ
    rzixAoGAbcOK7v+IUHamcWJb8kkAsrIxjAGE/CNLYiZTeSTbTegZFb9KcpNzojJT
    ClvuFGYh3Rb35NMC9XIvJbAfWBv1XB+TX+o41YcS8H3AocQtuxmxNqYzZOvUpAkM
    oWo54arDcDjcPm2TYZ0umKl/CacGYTwfUpA42BEpoxx+RcF7/XU=
    -----END RSA PRIVATE KEY-----",
    "approver_email": "admin@example.com",
    "created_at": "2011-05-14T15:14:43Z",
    "updated_at": "2011-05-14T15:14:43Z",
    "configured_at": "2011-05-14T15:14:43Z",
    "expires_on": "2012-05-14"
  }
}
~~~


## Purchase a domain certificate

    POST /domains/:domain/certificates

This is the first step in the process for buying a certificate. Once you have successfully purchased a certificate you will need to submit it to complete the process and receive your SSL certificate.

### Parameters

| Name | Type | Description |
| -----|------|-------------|
`:domain` | `string`, `integer` | The domain name or id

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -X POST \
          -H 'Content-Type: application/json' \
          -d '<json>' \
          https://api.dnsimple.com/v1/domains/:domain/certificates

### Input

certificate.name
: Required _string_ subdomain for the certificate.
  Leave it blank to purchase a certificate for the root domain.
  Enter `*` to purchase a wildcard certificate for the domain.
  Enter the subdomain name to purchase a certificate for a subdomain, for example use `www` to purchase the certificate for `www.mydomain.com`.

certificate.contact_id
: Required _integer_ corresponding to the ID of the contact responsible for the certificate.
  In case of wildcard domains, the contact information must match what is in the Certificate Signing Request.
  If you plan on submitting your own Certificate Signing Request then you must ensure these details match.

certificate.csr
: Optional _string_ with a custom Certificate Signing Request.

~~~ js
{
  "certificate": {
    "name": "www",
    "contact_id": 100
  }
}
~~~

### Response

~~~ js
{
  "certificate": {
    "id": 2,
    "domain_id": 1,
    "contact_id": 100,
    "name": "www",
    "state": "purchased",
    "csr": "-----BEGIN NEW CERTIFICATE REQUEST-----
    MIIC0DCCAbgCAQAwWzELMAkGA1UEBhMCVVMxFTATBgNVBAoTDEFudGhvbnkgRWRl
    bjEOMAwGA1UEBxMFTWlhbWkxCzAJBgNVBAgTAkZMMRgwFgYDVQQDEw93d3cuZXhh
    bXBsZS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCtW/z7avuO
    CrvfRBYkqJt+2w8YlivjMrUTOJT2DQdqXTnOgqnOeL4+Jdey9BBaJRQS+HhPLkJN
    rBmv9uDOEzQBAfm3POP/2Cg6ZvDren+fZuziq+FRopxDiaDupnWgVxCAzxu9wzOb
    dXQW5dB0BnrtPsclYhPwgSMIhxaCbeJSIDP1WveCZzRyLIthg6ajOMsKILKJ+TQg
    K64dpV4LGU5uLUrYHCMMatQ5OZ+N1PKL3nPLSKEHtLnYxKDoX3em5tRz7pc4JsIC
    UFOIRIuQr7Gdp9sH9fHVwcvZL5q1Ykz83rWKHAhu2vBL04n3EYFLYlA9NzPO23Zj
    GkWYafsn1gu9AgMBAAGgMDAuBgkqhkiG9w0BCQ4xITAfMAwGA1UdEwEB/wQCMAAw
    DwYDVR0PAQH/BAUDAweAADANBgkqhkiG9w0BAQUFAAOCAQEAgl4cBmVFpbl1Y1iD
    H6xPeRaT60jp2pPi3pwE7jTw6oqTSqCuH9EAvG2FopUlV7Jz10I8w7Cts2fwgayr
    h6MnSTUv1Nep6pEKrQaOYbAmwioTEZaNyzRwQVy6geKcz0PZeVFHm7Hs57WTJQiR
    bpm0sc/Rhu9h19y14KRlfWUwQU8rM8biJSGJhIpJ9TqtxMcKgswYKV8L6pt4ZvKM
    /IuGxTqSv4pJagzSCbww+8uyKfscOMnEUkkFOE2/kK+Bf+EdAy2rKLJDqPRc1Yeb
    WUf0sRMLu6e50I140w2YYIyyKR10KHP6PQmr+Fz9DxEmjgAY7BWOLS3TSwqCm0Ek
    t0evlw==
    -----END NEW CERTIFICATE REQUEST-----",
    "ssl_certificate": null,
    "private_key": "-----BEGIN RSA PRIVATE KEY-----
    MIIEogIBAAKCAQEArVv8+2r7jgq730QWJKibftsPGJYr4zK1EziU9g0Hal05zoKp
    zni+PiXXsvQQWiUUEvh4Ty5CTawZr/bgzhM0AQH5tzzj/9goOmbw63p/n2bs4qvh
    UaKcQ4mg7qZ1oFcQgM8bvcMzm3V0FuXQdAZ67T7HJWIT8IEjCIcWgm3iUiAz9Vr3
    gmc0ciyLYYOmozjLCiCyifk0ICuuHaVeCxlObi1K2BwjDGrUOTmfjdTyi95zy0ih
    B7S52MSg6F93pubUc+6XOCbCAlBTiESLkK+xnafbB/Xx1cHL2S+atWJM/N61ihwI
    btrwS9OJ9xGBS2JQPTczztt2YxpFmGn7J9YLvQIDAQABAoIBAADxEvq6pgsre8HG
    uOgSEmYqAnb7udlOGTW1hPmhMH0fbIT2qL16Ym4r/nP2Z3BV6zn/J4gmlC2f1bPi
    /22fJRUsUZLxPbvSDMXkcUKWM8NF59uDW4H6BCdJxBoHxXPNhUVt2pS5Trp1dN/6
    95rpvhkz0hkd40XXLb2KHlEvD5+qktOU7xg7R7aRATg6KtEpSxDqKwNy5o3+YVAe
    Z+nhYCevKboshMuJFx7OJ0zvn3gYU7/85RI9Zn4ofqUjFzZl6PPHmb6xn5v1v6+5
    t9gp19FF1MbMFpnKnsbR/2jm5xX3BVo5PofM2Xx04hThCi9pno/JApdJ95nOzmuK
    bQT9YIECgYEAzW2KugAoN0JwhlGc9pIcZ1OyM9YYAN4KHCVlaFIIfWD1PoP1uieV
    EIsGb9bworQgItXi6SwFnw+i9eRZI70Hmx+Y8SSY9IDtiI1nY5W71H9+9CJS/foc
    zDbmYclR/1e91MVwAVJDScECCuic9NUfxjaZDKChRPifKCXBG0wRGjUCgYEA2Als
    hJSsVQby00b+YuMCVp6IbyhvlGm6hKrKAQXNMhZWrHIs52qrlbuqeyfYg9IjGhSS
    +qNBRj/KzFvx8QuU55M3ydHZzz5Ah8MzwfP8gbVsdkPvnDbPvHDUkAFpewsp/4OG
    F5559iRwv/JStGgEtwnNV91JX5mmGOI7KxCynGkCgYAdlwnEgQFJ9GgA8QCLA8DT
    oVqp3MzYUyNhqoFQ5YATj0PEHX3nsovmNiBXO76tsQRwAB8PNygYIUh34sx0OWY/
    Ee4Vzg+6KFgOs0+RKKBFm5fN0qPhsYU0ZTQKIdWN0jWl0Eqx5geLOCHzME5rdcd9
    5Z9mEj0okidawRVvuSU9gQKBgDh7DkIDVKLONEIEd5GG5B+dRvI40iMtGTSCKlnm
    GGWV7YccOp0uCDoXXFTib/rWv5Kb+mlIsVIab3zKNRDeBEoe9SDwmk9SaTCVWjzE
    +yk2M2sgC879jYYowYn8tIUUwCArVK1sI1q04D1uryy3XTQ1fdgQ5JP36bLrwqhZ
    rzixAoGAbcOK7v+IUHamcWJb8kkAsrIxjAGE/CNLYiZTeSTbTegZFb9KcpNzojJT
    ClvuFGYh3Rb35NMC9XIvJbAfWBv1XB+TX+o41YcS8H3AocQtuxmxNqYzZOvUpAkM
    oWo54arDcDjcPm2TYZ0umKl/CacGYTwfUpA42BEpoxx+RcF7/XU=
    -----END RSA PRIVATE KEY-----",
    "approver_email": nil,
    "created_at": "2011-05-14T15:14:43Z",
    "updated_at": "2011-05-14T15:14:43Z",
    "configured_at": nil,
    "expires_on": "2012-05-14"
  }
}
~~~


## Configure a domain certificate

Configured a purchased certificate.

    PUT /domains/:domain/certificates/:id/configure

### Parameters

| Name | Type | Description |
| -----|------|-------------|
`:domain` | `string`, `integer` | The domain name or id

:id
: The _integer_ certificate id

### Example

Configure the certificate with ID `2`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -X PUT \
          -H 'Content-Type: application/json' \
          https://api.dnsimple.com/v1/domains/example.com/certificates/2/configure

### Response

~~~ js
{
  "certificate": {
    "id": 2,
    "domain_id": 1,
    "contact_id": 100,
    "name": "www",
    "state": "configured",
    "csr": "-----BEGIN NEW CERTIFICATE REQUEST-----
    MIIC0DCCAbgCAQAwWzELMAkGA1UEBhMCVVMxFTATBgNVBAoTDEFudGhvbnkgRWRl
    bjEOMAwGA1UEBxMFTWlhbWkxCzAJBgNVBAgTAkZMMRgwFgYDVQQDEw93d3cuZXhh
    bXBsZS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCtW/z7avuO
    CrvfRBYkqJt+2w8YlivjMrUTOJT2DQdqXTnOgqnOeL4+Jdey9BBaJRQS+HhPLkJN
    rBmv9uDOEzQBAfm3POP/2Cg6ZvDren+fZuziq+FRopxDiaDupnWgVxCAzxu9wzOb
    dXQW5dB0BnrtPsclYhPwgSMIhxaCbeJSIDP1WveCZzRyLIthg6ajOMsKILKJ+TQg
    K64dpV4LGU5uLUrYHCMMatQ5OZ+N1PKL3nPLSKEHtLnYxKDoX3em5tRz7pc4JsIC
    UFOIRIuQr7Gdp9sH9fHVwcvZL5q1Ykz83rWKHAhu2vBL04n3EYFLYlA9NzPO23Zj
    GkWYafsn1gu9AgMBAAGgMDAuBgkqhkiG9w0BCQ4xITAfMAwGA1UdEwEB/wQCMAAw
    DwYDVR0PAQH/BAUDAweAADANBgkqhkiG9w0BAQUFAAOCAQEAgl4cBmVFpbl1Y1iD
    H6xPeRaT60jp2pPi3pwE7jTw6oqTSqCuH9EAvG2FopUlV7Jz10I8w7Cts2fwgayr
    h6MnSTUv1Nep6pEKrQaOYbAmwioTEZaNyzRwQVy6geKcz0PZeVFHm7Hs57WTJQiR
    bpm0sc/Rhu9h19y14KRlfWUwQU8rM8biJSGJhIpJ9TqtxMcKgswYKV8L6pt4ZvKM
    /IuGxTqSv4pJagzSCbww+8uyKfscOMnEUkkFOE2/kK+Bf+EdAy2rKLJDqPRc1Yeb
    WUf0sRMLu6e50I140w2YYIyyKR10KHP6PQmr+Fz9DxEmjgAY7BWOLS3TSwqCm0Ek
    t0evlw==
    -----END NEW CERTIFICATE REQUEST-----",
    "ssl_certificate": null,
    "private_key": "-----BEGIN RSA PRIVATE KEY-----
    MIIEogIBAAKCAQEArVv8+2r7jgq730QWJKibftsPGJYr4zK1EziU9g0Hal05zoKp
    zni+PiXXsvQQWiUUEvh4Ty5CTawZr/bgzhM0AQH5tzzj/9goOmbw63p/n2bs4qvh
    UaKcQ4mg7qZ1oFcQgM8bvcMzm3V0FuXQdAZ67T7HJWIT8IEjCIcWgm3iUiAz9Vr3
    gmc0ciyLYYOmozjLCiCyifk0ICuuHaVeCxlObi1K2BwjDGrUOTmfjdTyi95zy0ih
    B7S52MSg6F93pubUc+6XOCbCAlBTiESLkK+xnafbB/Xx1cHL2S+atWJM/N61ihwI
    btrwS9OJ9xGBS2JQPTczztt2YxpFmGn7J9YLvQIDAQABAoIBAADxEvq6pgsre8HG
    uOgSEmYqAnb7udlOGTW1hPmhMH0fbIT2qL16Ym4r/nP2Z3BV6zn/J4gmlC2f1bPi
    /22fJRUsUZLxPbvSDMXkcUKWM8NF59uDW4H6BCdJxBoHxXPNhUVt2pS5Trp1dN/6
    95rpvhkz0hkd40XXLb2KHlEvD5+qktOU7xg7R7aRATg6KtEpSxDqKwNy5o3+YVAe
    Z+nhYCevKboshMuJFx7OJ0zvn3gYU7/85RI9Zn4ofqUjFzZl6PPHmb6xn5v1v6+5
    t9gp19FF1MbMFpnKnsbR/2jm5xX3BVo5PofM2Xx04hThCi9pno/JApdJ95nOzmuK
    bQT9YIECgYEAzW2KugAoN0JwhlGc9pIcZ1OyM9YYAN4KHCVlaFIIfWD1PoP1uieV
    EIsGb9bworQgItXi6SwFnw+i9eRZI70Hmx+Y8SSY9IDtiI1nY5W71H9+9CJS/foc
    zDbmYclR/1e91MVwAVJDScECCuic9NUfxjaZDKChRPifKCXBG0wRGjUCgYEA2Als
    hJSsVQby00b+YuMCVp6IbyhvlGm6hKrKAQXNMhZWrHIs52qrlbuqeyfYg9IjGhSS
    +qNBRj/KzFvx8QuU55M3ydHZzz5Ah8MzwfP8gbVsdkPvnDbPvHDUkAFpewsp/4OG
    F5559iRwv/JStGgEtwnNV91JX5mmGOI7KxCynGkCgYAdlwnEgQFJ9GgA8QCLA8DT
    oVqp3MzYUyNhqoFQ5YATj0PEHX3nsovmNiBXO76tsQRwAB8PNygYIUh34sx0OWY/
    Ee4Vzg+6KFgOs0+RKKBFm5fN0qPhsYU0ZTQKIdWN0jWl0Eqx5geLOCHzME5rdcd9
    5Z9mEj0okidawRVvuSU9gQKBgDh7DkIDVKLONEIEd5GG5B+dRvI40iMtGTSCKlnm
    GGWV7YccOp0uCDoXXFTib/rWv5Kb+mlIsVIab3zKNRDeBEoe9SDwmk9SaTCVWjzE
    +yk2M2sgC879jYYowYn8tIUUwCArVK1sI1q04D1uryy3XTQ1fdgQ5JP36bLrwqhZ
    rzixAoGAbcOK7v+IUHamcWJb8kkAsrIxjAGE/CNLYiZTeSTbTegZFb9KcpNzojJT
    ClvuFGYh3Rb35NMC9XIvJbAfWBv1XB+TX+o41YcS8H3AocQtuxmxNqYzZOvUpAkM
    oWo54arDcDjcPm2TYZ0umKl/CacGYTwfUpA42BEpoxx+RcF7/XU=
    -----END RSA PRIVATE KEY-----",
    "approver_email": nil,
    "approver_emails": ["admin@example.com", "admin@www.example.com"],
    "created_at": "2011-05-14T15:14:43Z",
    "updated_at": "2011-05-14T15:14:43Z",
    "configured_at": "2011-05-14T15:14:43Z",
    "expires_on": "2012-05-14"
  }
}
~~~


## Submit a domain certificate

Submit a configured certificate for signing by the certificate authority.

    PUT /domains/:domain/certificates/:id/submit

### Parameters

| Name | Type | Description |
| -----|------|-------------|
`:domain` | `string`, `integer` | The domain name or id

:id
: The _integer_ certificate id

### Example

Submit the certificate with ID `2`.

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -X PUT \
          -H 'Content-Type: application/json' \
          -d '<json>' \
          https://api.dnsimple.com/v1/domains/example.com/certificates/2/submit

### Input

certificate.approver_email
: Required _string_

~~~ js
{
  "certificate": {
    "approver_email": "admin@example.com"
  }
}
~~~

### Response

~~~ js
{
  "certificate": {
    "id": 2,
    "domain_id": 1,
    "contact_id": 100,
    "name": "www",
    "state": "submitted",
    "csr": "-----BEGIN NEW CERTIFICATE REQUEST-----
    MIIC0DCCAbgCAQAwWzELMAkGA1UEBhMCVVMxFTATBgNVBAoTDEFudGhvbnkgRWRl
    bjEOMAwGA1UEBxMFTWlhbWkxCzAJBgNVBAgTAkZMMRgwFgYDVQQDEw93d3cuZXhh
    bXBsZS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCtW/z7avuO
    CrvfRBYkqJt+2w8YlivjMrUTOJT2DQdqXTnOgqnOeL4+Jdey9BBaJRQS+HhPLkJN
    rBmv9uDOEzQBAfm3POP/2Cg6ZvDren+fZuziq+FRopxDiaDupnWgVxCAzxu9wzOb
    dXQW5dB0BnrtPsclYhPwgSMIhxaCbeJSIDP1WveCZzRyLIthg6ajOMsKILKJ+TQg
    K64dpV4LGU5uLUrYHCMMatQ5OZ+N1PKL3nPLSKEHtLnYxKDoX3em5tRz7pc4JsIC
    UFOIRIuQr7Gdp9sH9fHVwcvZL5q1Ykz83rWKHAhu2vBL04n3EYFLYlA9NzPO23Zj
    GkWYafsn1gu9AgMBAAGgMDAuBgkqhkiG9w0BCQ4xITAfMAwGA1UdEwEB/wQCMAAw
    DwYDVR0PAQH/BAUDAweAADANBgkqhkiG9w0BAQUFAAOCAQEAgl4cBmVFpbl1Y1iD
    H6xPeRaT60jp2pPi3pwE7jTw6oqTSqCuH9EAvG2FopUlV7Jz10I8w7Cts2fwgayr
    h6MnSTUv1Nep6pEKrQaOYbAmwioTEZaNyzRwQVy6geKcz0PZeVFHm7Hs57WTJQiR
    bpm0sc/Rhu9h19y14KRlfWUwQU8rM8biJSGJhIpJ9TqtxMcKgswYKV8L6pt4ZvKM
    /IuGxTqSv4pJagzSCbww+8uyKfscOMnEUkkFOE2/kK+Bf+EdAy2rKLJDqPRc1Yeb
    WUf0sRMLu6e50I140w2YYIyyKR10KHP6PQmr+Fz9DxEmjgAY7BWOLS3TSwqCm0Ek
    t0evlw==
    -----END NEW CERTIFICATE REQUEST-----",
    "ssl_certificate": null,
    "private_key": "-----BEGIN RSA PRIVATE KEY-----
    MIIEogIBAAKCAQEArVv8+2r7jgq730QWJKibftsPGJYr4zK1EziU9g0Hal05zoKp
    zni+PiXXsvQQWiUUEvh4Ty5CTawZr/bgzhM0AQH5tzzj/9goOmbw63p/n2bs4qvh
    UaKcQ4mg7qZ1oFcQgM8bvcMzm3V0FuXQdAZ67T7HJWIT8IEjCIcWgm3iUiAz9Vr3
    gmc0ciyLYYOmozjLCiCyifk0ICuuHaVeCxlObi1K2BwjDGrUOTmfjdTyi95zy0ih
    B7S52MSg6F93pubUc+6XOCbCAlBTiESLkK+xnafbB/Xx1cHL2S+atWJM/N61ihwI
    btrwS9OJ9xGBS2JQPTczztt2YxpFmGn7J9YLvQIDAQABAoIBAADxEvq6pgsre8HG
    uOgSEmYqAnb7udlOGTW1hPmhMH0fbIT2qL16Ym4r/nP2Z3BV6zn/J4gmlC2f1bPi
    /22fJRUsUZLxPbvSDMXkcUKWM8NF59uDW4H6BCdJxBoHxXPNhUVt2pS5Trp1dN/6
    95rpvhkz0hkd40XXLb2KHlEvD5+qktOU7xg7R7aRATg6KtEpSxDqKwNy5o3+YVAe
    Z+nhYCevKboshMuJFx7OJ0zvn3gYU7/85RI9Zn4ofqUjFzZl6PPHmb6xn5v1v6+5
    t9gp19FF1MbMFpnKnsbR/2jm5xX3BVo5PofM2Xx04hThCi9pno/JApdJ95nOzmuK
    bQT9YIECgYEAzW2KugAoN0JwhlGc9pIcZ1OyM9YYAN4KHCVlaFIIfWD1PoP1uieV
    EIsGb9bworQgItXi6SwFnw+i9eRZI70Hmx+Y8SSY9IDtiI1nY5W71H9+9CJS/foc
    zDbmYclR/1e91MVwAVJDScECCuic9NUfxjaZDKChRPifKCXBG0wRGjUCgYEA2Als
    hJSsVQby00b+YuMCVp6IbyhvlGm6hKrKAQXNMhZWrHIs52qrlbuqeyfYg9IjGhSS
    +qNBRj/KzFvx8QuU55M3ydHZzz5Ah8MzwfP8gbVsdkPvnDbPvHDUkAFpewsp/4OG
    F5559iRwv/JStGgEtwnNV91JX5mmGOI7KxCynGkCgYAdlwnEgQFJ9GgA8QCLA8DT
    oVqp3MzYUyNhqoFQ5YATj0PEHX3nsovmNiBXO76tsQRwAB8PNygYIUh34sx0OWY/
    Ee4Vzg+6KFgOs0+RKKBFm5fN0qPhsYU0ZTQKIdWN0jWl0Eqx5geLOCHzME5rdcd9
    5Z9mEj0okidawRVvuSU9gQKBgDh7DkIDVKLONEIEd5GG5B+dRvI40iMtGTSCKlnm
    GGWV7YccOp0uCDoXXFTib/rWv5Kb+mlIsVIab3zKNRDeBEoe9SDwmk9SaTCVWjzE
    +yk2M2sgC879jYYowYn8tIUUwCArVK1sI1q04D1uryy3XTQ1fdgQ5JP36bLrwqhZ
    rzixAoGAbcOK7v+IUHamcWJb8kkAsrIxjAGE/CNLYiZTeSTbTegZFb9KcpNzojJT
    ClvuFGYh3Rb35NMC9XIvJbAfWBv1XB+TX+o41YcS8H3AocQtuxmxNqYzZOvUpAkM
    oWo54arDcDjcPm2TYZ0umKl/CacGYTwfUpA42BEpoxx+RcF7/XU=
    -----END RSA PRIVATE KEY-----",
    "approver_email": "admin@example.com",
    "created_at": "2011-05-14T15:14:43Z",
    "updated_at": "2011-05-14T15:14:43Z",
    "configured_at": "2011-05-14T15:14:43Z",
    "expires_on": "2012-05-14"
  }
}
~~~
