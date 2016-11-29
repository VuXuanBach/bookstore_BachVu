@javascript
Feature: Forgot password page

  Scenario: Visit forgot password page
    Given I am an anonymous user
    When I visit "forgot password page"
    Then I should see "Forgot your password?"
