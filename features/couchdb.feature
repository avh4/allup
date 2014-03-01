Feature: validating couchdb installation
  Background:
    Given my allup file contains:
      """
      { couchdb: true }
      """

  Scenario: couchdb is ready to go
    Given GET "http://localhost:5984" responds:
      """
      {"couchdb":"Welcome","uuid":"00000000000000000000000000000000","version":"1.5.0","vendor":{"version":"1.5.0-1","name":"Homebrew"}}
      """
    When I run `allup`
    Then the output should contain "couchdb: OK"

  Scenario: no couchdb on the expected port
    Given GET "http://localhost:5984" does not connect
    When I run `allup`
    Then the output should contain "couchdb: not running on port 5984"
    And the output should contain "brew install couchdb"
    And the output should contain "ln -sfv /usr/local/opt/couchdb/*.plist ~/Library/LaunchAgents"
    And the output should contain "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.couchdb.plist"
