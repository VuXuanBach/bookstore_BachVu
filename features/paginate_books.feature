@javascript
Feature: Pagination

  Scenario: Default number of books per page
    Given There are 20 books
    When I visit home page
    Then I should see 10 books

  Scenario Outline: Change number of books per page
    Given There are 20 books
    When I visit home page
    And I change number of book per page to <number book page>
    Then I should see <book number> books

    Examples:
    | number book page | book number |
    | 1                | 1           |
    | 5                | 5           |

  Scenario: Paginate to second page
    Given There are 20 books
    When I visit home page
    And I click "Next"
    Then I should see 10 books
