@javascript
Feature: Admin site

  Scenario: Visit admin site as normal user
    Given I login as a normal user
    When I visit "admin page"
    Then I should not see "Site Administration"

  Scenario: Visit admin site as admin
    Given I login as an admin
    When I visit "admin page"
    Then I should see "Site Administration"

  Scenario: Visit admin site as admin
    Given I am an anonymous user
    When I visit "admin page"
    Then I should see "Login"
