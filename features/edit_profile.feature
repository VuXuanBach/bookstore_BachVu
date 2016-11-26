@javascript
Feature: Edit profile page

  Scenario: Visit edit profile page as anonymous user
    Given I am an anonymous user
    When I visit edit profile page
    Then I should see "You need to sign in or sign up before continuing."

  Scenario: Visit edit profile page as logged in user
    Given I login as a normal user
    When I visit edit profile page
    Then I should see "Edit Profile"
