@javascript
Feature: Add book to cart

  Scenario: Add book from book list to cart
  Given I am an anonymous user
  And There are 2 books
  When I visit home page
  And I click Add to cart of first book
  Then I should see "Book is added to order successfully"

  Scenario: Add book from book detail to cart
  Given I am an anonymous user
  And There are 2 books
  And There are several comments belong to each book
  When I visit "book details page"
  And I click Add to cart of that book
  Then I should see "Book is added to order successfully"
