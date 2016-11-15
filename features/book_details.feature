@javascript
Feature: Book details

  Scenario: View book details
  Given There are 20 books
  When I visit home page
  And I click on details of a book
  Then I should see that book details
  And I should not see another book details
