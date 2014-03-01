package main

import "fmt"
import "net/http"

func main() {
	var resp, err = http.Get("http://localhost:5984")
	if err != nil {
		fmt.Println("couchdb: not running on port 5984")
		fmt.Println("")
		fmt.Println("    brew install couchdb")
		fmt.Println("    ln -sfv /usr/local/opt/couchdb/*.plist ~/Library/LaunchAgents")
		fmt.Println("    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.couchdb.plist")
		fmt.Println("")
	} else {
		defer resp.Body.Close()
		fmt.Println("couchdb: OK")
	}
}
