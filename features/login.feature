@javascript
Feature: Login page

  Scenario: Visit login page
    Given I am an anonymous user
    When I visit "login page"
    Then I should see "Login"
