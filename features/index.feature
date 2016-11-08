@javascript
Feature: Index page

  Scenario: Visit index page as anonymous user
    Given I am an anonymous user
    When I visit index page
    Then I should see "Log In,Sign Up"

  Scenario: Visit index page as logged in user
    Given I am already logged into the system
    When I visit index page
    Then I should not see "Log In,Sign Up"
