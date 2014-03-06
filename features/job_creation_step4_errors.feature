Feature: Leaving necessary fields empty in job creation step 4 should produce error message

  Background:
    Given I am loged in
    And I follow "Add New Job" link ond dashboard page
    And I type "Test" in title text field
    And I type "Description" in description text field
    And I click "Next - Job Details" button on new job page
    And I check "Onsite" for work type
    And I set desired start date to today's date
    And I select "full_time" for desired commitment
    And I select random estimated length
    And I click "Next - Required Skills" button on new job page
    And I type "Ruby" in languages field
    And I select "Ruby" from languages dropdown menu
    And I set rating to "Strong"
    And I type "Rails" in frameworks field
    And I select "Rails" from frameworks dropdown menu
    And I click "Next - Confirmation" button on new job page

  Scenario: Attempt to create job without without checking review checkbox
    When I uncheck review checkbox
    And I check notice checkbox
    And I check deposit checkbox
    And I click "Submit and See What's Next" button on new job page
    Then I should see 1 error message "You need to confirm this"

  Scenario: Attempt to create job without checking notice checkbox
    When I check review checkbox
    And I uncheck notice checkbox
    And I check deposit checkbox
    And I click "Submit and See What's Next" button on new job page
    Then I should see 1 error message "You need to confirm this"

  Scenario: Attempt to create job without checking deposit checkbox
    When I check review checkbox
    And I check notice checkbox
    And I uncheck deposit checkbox
    And I click "Submit and See What's Next" button on new job page
    Then I should see 1 error message "You need to confirm this"

  Scenario: Attempt to create job without checking review and notice checkboxex
    When I uncheck review checkbox
    And I uncheck notice checkbox
    And I check deposit checkbox
    And I click "Submit and See What's Next" button on new job page
    Then I should see 2 error messages "You need to confirm this"

  Scenario: Attempt to create job without checking any checkbox
    When I uncheck review checkbox
    And I uncheck notice checkbox
    And I uncheck deposit checkbox
    And I click "Submit and See What's Next" button on new job page
    Then I should see 3 error messages "You need to confirm this"

