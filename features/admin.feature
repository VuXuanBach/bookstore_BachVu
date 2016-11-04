@javascript
Feature: Admin site

  Scenario: Visit admin site as normal user
    Given I am a normal user
    When I visit admin page as normal user
    Then I should not see "Site Administration"

  Scenario: Visit admin site as admin
    Given I am an admin
    When I visit admin page as admin
    Then I should see "Site Administration"
