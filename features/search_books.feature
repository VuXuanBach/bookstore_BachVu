@javascript
Feature: Search for books

  Scenario Outline: Search books
    Given There is a list of categories named "Cat1, Cat2"
    And There is a list of books belong to each category with name "Cat1 Book1, Cat1 Book2" and so on
    And Each book has author with name "Author1, Author2" respectively
    When I visit home page
    And I search "<search input>"
    Then I should see "<book title>"

    Examples:
      | search input  | book title             |
      | Book2         | Cat1 Book2, Cat2 Book2 |
      | Cat1          | Cat1 Book1, Cat1 Book2 |
      | Cat1 Book1    | Cat1 Book1             |
      | Author2       | Cat1 Book2, Cat2 Book2 |
      | Cat1 Author1  | Cat1 Book1             |
      | something     | No books found         |
