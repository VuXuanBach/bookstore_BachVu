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
