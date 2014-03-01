package main

import (
	"encoding/json"
	"fmt"
	"github.com/codegangsta/cli"
	"net/http"
	"os"
	"os/exec"
)

func main() {
	app := cli.NewApp()
	app.Name = "allup"
	app.Action = func(c *cli.Context) {
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
	app.Commands = []cli.Command{
		{
			Name:  "test",
			Usage: "Run tests",
			Action: func(c *cli.Context) {
				allupFile, err := os.Open(".allup")
				if err != nil {
					println(err)
					return
				}
				var settings struct {
					Couchdb  bool
					Commands struct {
						Test string
					}
				}
				jsonParser := json.NewDecoder(allupFile)
				err = jsonParser.Decode(&settings)
				if err != nil {
					fmt.Println(err)
					return
				}

				cmd := exec.Command("sh", "-xc", settings.Commands.Test)
				cmd.Stdout = os.Stdout
				cmd.Stderr = os.Stderr
				err = cmd.Run()
				if err != nil {
					fmt.Println(err)
					return
				}
			},
		},
	}

	app.Run(os.Args)
}
