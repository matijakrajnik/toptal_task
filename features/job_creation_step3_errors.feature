Feature: Leaving necessary fields empty in job creation step 3 should produce error message

  Background:
    Given I am loged in
    And I follow "Add New Job" link ond dashboard page
    And I type "Test" in title text field
    And I type "Description" in description text field
    And I click "Next - Job Details" button on new job page
    And I check "Onsite" for work type
    And I set desired start date to today
    And I select "full_time" for desired commitment
    And I select random estimated length
    And I click "Next - Required Skills" button on new job page

  Scenario: Attempt to create job without selecting any skill
    When I click "Next - Confirmation" button on new job page
    Then I should see error message "Must be at least 2 skills in total" on step 3 page

  Scenario: Attempt to create job with selecting only one skill
    When I type "Ruby" in languages field
    And I select "Ruby" from languages dropdown menu
    And I click "Next - Confirmation" button on new job page
    Then I should see error message "Must be at least 2 skills in total" on step 3 page

