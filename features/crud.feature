Feature: CRUD

  Scenario: show
    Given a user exists
    Given I visit user show page
    Then I should notice id of the last person
    Then I should see "Edit"
    Then I should see "Delete"
    Then I should see "Destroy"
    Then I should see crud show tabular attributes

  Scenario: show with association info
    Given the following user exists:
      | first name | last name |
      | Mary       | Jane      |
    Given the following website exists:
      | url             | user            |
      | www.google.com  | first name:Mary |
    Given the following phone number exists:
      | number        | user            |
      | 123-456-7890  | first name:Mary |
      | 123-456-7899  | first name:Mary |
    Given I visit user show page
    Then I should see "website"
    Then I should see "phone_numbers(2)"
    When I follow "website"
    Then I should notice id of website of the last person
    When I follow "user"
    When I follow "phone_numbers(2)"
    Then I should see "has 2 phone_numbers"

  Scenario: edit
    Given a user exists
    Given I visit user show page
    Given I follow "Edit"
    When I fill in the following:
      | user_first_name |  |
      | user_age        |  |
    When I press "Update"
    Then I should see "First name can't be blank"
    Then I should see "Age can't be blank"
    Then I should see "Age is not a number"
    Then I should find value "(auto)" for "created_at"
    Then I should find value "(auto)" for "updated_at"
    When I fill in the following:
      | user_first_name | Robert2 |
      | user_age        | 99 |
    When I press "Update"
    Then I should see "Robert2"
    Then I should see "99"
    Then I should see "Record was updated"

  Scenario: add a new record
    Given a user exists
    Given I visit quick_search page
    Given I follow "+Add New Record"
    Given I press "Create"
    Then I should see "First name can't be blank"
    Then I should see "Age can't be blank"
    Then I should see "Age is not a number"
    When I fill in the following:
      | user_first_name | Johny |
      | user_age        | 21    |
    When I press "Create"
    Then I should see "Record was created"
