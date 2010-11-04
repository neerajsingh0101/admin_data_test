Feature: homepage

  @javascript
  Scenario: admin_data homepage
    Given the following user exists:
      | first_name | last_name |
      | Mary       | Jane      |
      | John       | Smith     |
      | Neil       | Singh     |
      | Trisha     | Singh     |
    Given I visit admin_data page
    Then I should see "Select from the drop down menu above"
    When I follow "admin_data"
    Then I should see "Select from the drop down menu above"
    Then I should see page with proper dropdown values
    When I select "user" from "drop_down_klasses"
    Then first id of table should be of "Trisha"

  Scenario: footer links
    Given I visit admin_data page
    Then page should have link with text "admin_data" within "#footer" and url "http://github.com/neerajdotname/admin_data"
    Then page should have link with text "Report Bug" within "#footer" and url "http://github.com/neerajdotname/admin_data/issues"
    Then page should have link with text "Documentation" within "#footer" and url "http://github.com/neerajdotname/admin_data/wiki"
