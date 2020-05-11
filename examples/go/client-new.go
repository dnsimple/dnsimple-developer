package main

import (
	"context"
	"fmt"
	"os"

	"github.com/dnsimple/dnsimple-go/dnsimple"
	"golang.org/x/oauth2"
)

// template imports:start
// template imports:end

func main() {
	// template script:start
	oauthToken := os.Getenv("DNSIMPLE_TOKEN")
	ts := oauth2.StaticTokenSource(&oauth2.Token{AccessToken: oauthToken})
	tc := oauth2.NewClient(context.Background(), ts)

	client := dnsimple.NewClient(tc)
	// template script:end

	_ = client
	fmt.Println("SUCCESS")
}
