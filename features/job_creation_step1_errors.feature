Feature: Leaving necessary fields empty in job creation step 1 should produce error message

  Background:
    Given I am loged in
    And I follow "Add New Job" link ond dashboard page

  Scenario: Attempt to create job without a title
    When I type "Description" in description text field
    And I click "Next - Job Details" button on new job page
    Then I should see error message "You can't leave this empty" on step 1 page

  Scenario: Attempt to create job without a description
    When I type "Tets" in title text field
    And I click "Next - Job Details" button on new job page
    Then I should see error message "You can't leave this empty" on step 1 page

