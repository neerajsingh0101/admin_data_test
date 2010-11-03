Feature: Advance Search datetime

  @javascript
  Scenario: test dropdown for datetime
    Given a user exists
    Given I visit advance_search page
    When I select "created_at" from "adv_search[1_row][col1]"
    Then page should have css "#advance_search_table tr td select.col2"
    When I select "is null" from "adv_search[1_row][col2]"
    #Then page should have disabled css "#advance_search_table tr td input.col3"
    When I select "is not null" from "adv_search[1_row][col2]"
    #Then page should have disabled css "#advance_search_table tr td input.col3"
    When I select "on" from "adv_search[1_row][col2]"
    Then page should have text as current date for "#advance_search_table tr td input.col3" 
    When I select "on or before" from "adv_search[1_row][col2]"
    Then page should have text as current date for "#advance_search_table tr td input.col3" 
    When I select "on or after" from "adv_search[1_row][col2]"
    Then page should have text as current date for "#advance_search_table tr td input.col3" 
