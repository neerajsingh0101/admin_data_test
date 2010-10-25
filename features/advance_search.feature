Feature: Advance Search

  @javascript
  Scenario: Advance Search with first name
    Given a user exists
    Given I visit advance_search page
    Then page should have css "#advance_search_form"
    Then page should have css "#advance_search_table"
    Then page should have css "#advance_search_table tr td select.col1"
