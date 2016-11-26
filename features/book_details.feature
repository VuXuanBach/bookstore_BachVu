@javascript
Feature: Book details

  Scenario: View book details
    Given There are 5 books
    When I visit home page
    And I click on details of a book
    Then I should see that book details
    And I should not see another book details

  Scenario: View not found book details
    When I go to the random book area
    Then I should see "The page you were looking for doesn't exist."

  Scenario: View comments in book details
    Given I login as a normal user
    And There are 2 books
    And There are several comments belong to each book
    When I visit book details page
    Then I should see that book's comments
    And I should not see another book's comments

  Scenario: Comment on a book
    Given I login as a normal user
    And There are 2 books
    And There are several comments belong to each book
    When I visit book details page
    And I comment and rate that book
    Then I should see my new comment on that book

  Scenario: Anonymous user comment on a book
    Given I am an anonymous user
    And There are 2 books
    And There are several comments belong to each book
    When I visit book details page
    And I comment and rate that book
    Then I should see "Login"
    And I should see "You need to sign in or sign up before continuing!"
    When I login as a normal user
    Then I should see previous book detail page
