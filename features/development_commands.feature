Feature: Development commands
  In order to work on a new project
  As a new contributor
  I want to be able to perform standard commands on the project

  Scenario: Run tests
    Given my allup file contains:
      """
      { "commands": { "test": "echo 'TE''ST'" } }
      """
    When I run `allup test`
    Then the output should contain "TEST"
