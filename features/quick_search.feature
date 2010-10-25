Feature: quick search

  Scenario: quick search with no search term
    Given the following user exists:
      | first_name | last_name |
      | Mary       | Jane      |
      | John       | Smith     |
      | Neil       | Singh     |
      | Trisha     | Singh     |
    Given I visit quick_search page
    Then first id of table should be of "Trisha"
    Then I should see "Next →" 
    Then I follow "Next →" 
    Then first id of table should be of "John"
    When I select "id asc" from "sortby"
    When I press "Search"
    Then first id of table should be of "Mary"

  Scenario: quick search with search term
    Given the following user exists:
      | first_name | last_name |
      | Mary       | Jane      |
      | John       | Smith     |
    Given I visit quick_search page
    When I fill in "quick_search_input" with "John"
    When I press "Search"
    Then I should see "Search result: 1 record found"
    Then verify that user is John Smith

  Scenario: table structure
    Given I visit quick_search page
    When I follow "Table Structure"
    Then I should see "Table name : users"
    Then I should see following tabular attributes:
     |Column Name  | Type     | Null  | Default |
     | id          | integer  | false |         | 
     | first_name  | string   | true  |         | 
     | last_name   | string   | true  |         | 
     | age         | integer  | true  |         | 
     | data        | text     | true  |         | 
     | active      | boolean  | true  | false   | 
     | description | text     | true  |         | 
     | born_at     | datetime | true  |         | 
     | created_at  | datetime | true  |         | 
     | updated_at  | datetime | true  |         | 
