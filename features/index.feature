@javascript
Feature: Index page

  Scenario: Visit home page as anonymous user
    Given I am an anonymous user
    When I visit "home page"
    Then I should see "Log In,Sign Up"

  Scenario: Visit home page as logged in user
    Given I am already logged into the system
    When I visit "home page"
    Then I should not see "Log In,Sign Up"

  Scenario: Browse categories
    Given I am an anonymous user
    And There is a list of categories
    When I visit "home page"
    And I click Categories dropdown list
    Then I should see list of categories

  Scenario: Browse books of a category
    Given I am an anonymous user
    And There is a list of categories
    And There is a list of books
    When I visit "home page"
    And I choose a category
    Then I should see list of books belong to that category
    And I should not see list of books belong to other categories
