// Usage: TOKEN=token go run cmd/auth/auth.go
package main

import (
	"context"
	"fmt"
	"os"

	"github.com/dnsimple/dnsimple-go/dnsimple"
	"golang.org/x/oauth2"
)

func main() {
	oauthToken := os.Getenv("DNSIMPLE_TOKEN")

	ts := oauth2.StaticTokenSource(&oauth2.Token{AccessToken: oauthToken})
	tc := oauth2.NewClient(context.Background(), ts)
	client := dnsimple.NewClient(tc)
	client.SetUserAgent("dnsimple-examples")
	client.BaseURL = "https://api.sandbox.dnsimple.com"

	whoamiResponse, err := client.Identity.Whoami(context.Background())
	if err != nil {
		fmt.Printf("ERROR: %v\n", err)
		// FIXME: figure out how to access HTTP response
		// fmt.Printf("    HTTP: ???")
		return
	}

	fmt.Printf("SUCCESS: Request authenticated\n")
	if user := whoamiResponse.Data.User; user != nil {
		fmt.Printf("    User    : %v %v\n", user.ID, user.Email)
	} else {
		fmt.Printf("    User    : N/A\n")
	}
	if account := whoamiResponse.Data.Account; account != nil {
		fmt.Printf("    Account : %v %v\n", account.ID, account.Email)
	} else {
		fmt.Printf("    Account : N/A\n")
	}
}
