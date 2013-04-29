Feature: Logging In

  @javascript
  Scenario: I can log into the page
    Given I have an account
    When I go to the login page
    And I fill in login information
    Then I am sent to the scorecards index
