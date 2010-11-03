Feature: Advance Search for string

  @javascript
  Scenario: for is not null
    Given the following user exists:
      | first name | last name |
      | Mary       | Jane      |
      | John       |           |
    Given I visit advance_search page
    When I select "last_name" from "adv_search[1_row][col1]"
    Then show me the page
    When I select "is not null" from "adv_search[1_row][col2]"
    When I fill in "adv_search[1_row][col3]" with "John"
    When I press "Search"
    Then I should see "Search result: 1 record found"
    Then async verify that user "first_name" is "Mary"
    Then async verify that user "last_name" is "Jane"

  @javascript
  Scenario: for is null
    Given the following user exists:
      | first name | last name |
      | Mary       | Jane      |
      | Jennifer   | Jane      |
      | John       |           |
    Given I visit advance_search page
    When I select "last_name" from "adv_search[1_row][col1]"
    When I select "is null" from "adv_search[1_row][col2]"
    When I fill in "adv_search[1_row][col3]" with "John"
    When I press "Search"
    Then I should see "Search result: 1 record found"
    Then async verify that user "first_name" is "John"

  @javascript
  Scenario: for is exactly
    Given the following user exists:
      | first name | last name |
      | Mary       | Jane      |
      | Jennifer   | Jane      |
      | John       | Smith     |
    Given I visit advance_search page
    When I select "first_name" from "adv_search[1_row][col1]"
    When I select "is exactly" from "adv_search[1_row][col2]"
    When I fill in "adv_search[1_row][col3]" with "John"
    When I press "Search"
    Then I should see "Search result: 1 record found"
    Then async verify that user "first_name" is "John"
    Then async verify that user "last_name" is "Smith"

  @javascript
  Scenario: for contains
    Given the following user exists:
      | first name | last name |
      | Mary       | Jane      |
      | Jennifer   | Jane      |
      | Jenny      | Aniston   |
      | John       | Smith     |
    Given I visit advance_search page
    When I select "first_name" from "adv_search[1_row][col1]"
    When I select "contains" from "adv_search[1_row][col2]"
    When I fill in "adv_search[1_row][col3]" with "Jenn"
    When I press "Search"
    Then I should see "Search result: 2 records found"
    Then async verify that user "first_name" is "Jenny"
    Then async verify that user "last_name" is "Aniston"

  @javascript
  Scenario: for contains
    Given the following user exists:
      | first name | last name |
      | Mary       | Jane      |
      | Jennifer   | Jane      |
      | Jenny      | Aniston   |
      | John       | Smith     |
    Given I visit advance_search page
    When I select "first_name" from "adv_search[1_row][col1]"
    When I select "doesn't contain" from "adv_search[1_row][col2]"
    When I fill in "adv_search[1_row][col3]" with "Jenn"
    When I press "Search"
    Then I should see "Search result: 2 records found"
    Then async verify that user "first_name" is "John"
    Then async verify that user "last_name" is "Smith"

