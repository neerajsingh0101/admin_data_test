Feature: Advance Search

  @javascript
  Scenario: Advance Search with first name a string
    Given a user exists
    Given I visit advance_search page
    Then page should have css "#advance_search_form"
    Then page should have css "#advance_search_table"
    Then page should have css "#advance_search_table tr td select.col1"
    When I select "first_name" from "adv_search[1_row][col1]"
    Then page should have css "#advance_search_table tr td select.col2"
    When I select "contains" from "adv_search[1_row][col2]"
    When I select "is exactly" from "adv_search[1_row][col2]"
    When I select "doesn't contain" from "adv_search[1_row][col2]"
    When I select "is null" from "adv_search[1_row][col2]"
    When I select "is not null" from "adv_search[1_row][col2]"
