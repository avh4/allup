Feature: validating couchdb installation
  Background:
    Given my allup file contains:
      """
      { couchdb: true }
      """

  Scenario: couchdb is ready to go
    When I run `allup`
    Then the output should contain "couchdb: OK"
