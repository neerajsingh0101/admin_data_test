Feature: Migration

  @javascript
  Scenario: migration information
    Given I visit admin_data page
    When I select "Migration Information" from "drop_down_klasses"
    Then I should see "20091030202603"
    Then I should see "20091030202259"
    Then I should see "20091030202348"
