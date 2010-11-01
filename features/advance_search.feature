Feature: Advance Search

  @javascript
  Scenario: Advance Search for a string
    Given a user exists
    Given I visit advance_search page
    Then page should have css "#advance_search_form"
    Then page should have css "#advance_search_table"
    Then page should have css "#advance_search_table tr td select.col1"
    When I select "first_name" from "adv_search[1_row][col1]"
    Then page should have css "#advance_search_table tr td select.col2"
    When I select "contains" from "adv_search[1_row][col2]"
    Then page should have css "#advance_search_table tr td input.col3"
    When I select "is exactly" from "adv_search[1_row][col2]"
    Then page should have css "#advance_search_table tr td input.col3"
    When I select "doesn't contain" from "adv_search[1_row][col2]"
    Then page should have css "#advance_search_table tr td input.col3"
    When I select "is null" from "adv_search[1_row][col2]"
    Then page should have disabled css "#advance_search_table tr td input.col3"
    When I select "is not null" from "adv_search[1_row][col2]"
    Then page should have disabled css "#advance_search_table tr td input.col3"

  @javascript
  Scenario: Advance Search for a text field
    Given a user exists
    Given I visit advance_search page
    When I select "description" from "adv_search[1_row][col1]"
    Then page should have css "#advance_search_table tr td select.col2"
    When I select "Contains" from "adv_search[1_row][col2]"
    Then page should have css "#advance_search_table tr td input.col3"
    When I select "Doesn't Contain" from "adv_search[1_row][col2]"
    Then page should have css "#advance_search_table tr td input.col3"
    When I select "is null" from "adv_search[1_row][col2]"
    Then page should have disabled css "#advance_search_table tr td input.col3"
    When I select "is not null" from "adv_search[1_row][col2]"
    Then page should have disabled css "#advance_search_table tr td input.col3"


  @javascript
  Scenario: Advance Search for an integer
    Given a user exists
    Given I visit advance_search page
    When I select "age" from "adv_search[1_row][col1]"
    Then page should have css "#advance_search_table tr td select.col2"
    When I select "is equal to" from "adv_search[1_row][col2]"
    Then page should have css "#advance_search_table tr td input.col3"
    When I select "is less than" from "adv_search[1_row][col2]"
    Then page should have css "#advance_search_table tr td input.col3"
    When I select "is greater than" from "adv_search[1_row][col2]"
    Then page should have css "#advance_search_table tr td input.col3"

  @javascript
  Scenario: Advance Search for a boolean
    Given a user exists
    Given I visit advance_search page
    When I select "active" from "adv_search[1_row][col1]"
    Then page should have css "#advance_search_table tr td select.col2"
    When I select "is null" from "adv_search[1_row][col2]"
    Then page should have disabled css "#advance_search_table tr td input.col3"
    When I select "is not null" from "adv_search[1_row][col2]"
    Then page should have disabled css "#advance_search_table tr td input.col3"
    When I select "is true" from "adv_search[1_row][col2]"
    Then page should have disabled css "#advance_search_table tr td input.col3"
    When I select "is false" from "adv_search[1_row][col2]"
    Then page should have disabled css "#advance_search_table tr td input.col3"


  @javascript
  Scenario: Advance Search for a datetime
    Given a user exists
    Given I visit advance_search page
    When I select "created_at" from "adv_search[1_row][col1]"
    Then page should have css "#advance_search_table tr td select.col2"
    When I select "is null" from "adv_search[1_row][col2]"
    Then page should have disabled css "#advance_search_table tr td input.col3"
    When I select "is not null" from "adv_search[1_row][col2]"
    Then page should have disabled css "#advance_search_table tr td input.col3"
    When I select "on" from "adv_search[1_row][col2]"
    Then page should have css "#advance_search_table tr td input.col3"
    Then page should have text as current date for "#advance_search_table tr td input.col3" 
    When I select "on or before" from "adv_search[1_row][col2]"
    Then page should have text as current date for "#advance_search_table tr td input.col3" 
