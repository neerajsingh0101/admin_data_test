Feature: homepage

  @javascript
  Scenario: admin_data homepage
    Given a user exists
    Given a user exists
    Given a user exists
    Given a user exists
    Given I visit admin_data page
    Then I should see "Select a model"
    When I follow "admin_data"
    Then I should see "Select a model"
    Then I should see page with proper dropdown values
    When I select "user" from "drop_down_klasses"
    Then first id of table should be the last record of the table

  @javascript
  Scenario: migration information
    Given I visit admin_data page
    When I select "Migration Information" from "drop_down_klasses"
    Then show me the page
    Then I should see "20091030202603"
    Then I should see "20091030202259"
    Then I should see "20091030202348"

  Scenario: footer links
    Given I visit admin_data page
    Then footer should have link "admin_data" linking to "http://github.com/neerajdotname/admin_data"
    Then footer should have link "Report Bug" linking to "http://github.com/neerajdotname/admin_data/issues"
    Then footer should have link "Documentation" linking to "http://github.com/neerajdotname/admin_data/wiki"
