@javascript
Feature: Register page

  Scenario: Visit registration page
    Given I am an anonymous user
    When I visit "registration page"
    Then I should see "Register"
