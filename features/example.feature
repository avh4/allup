Feature: test cucumber
  Scenario: couchdb is ready to go
    When I run `allup`
    Then the output should contain "Hello World"
