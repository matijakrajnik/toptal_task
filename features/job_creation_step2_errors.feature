Feature: Leaving necessary fields empty in job creation step 2 should produce error message

  Background:
    Given I am loged in
    And I follow "Add New Job" link ond dashboard page
    And I type "Test" in title text field
    And I type "Description" in description text field
    And I click "Next - Job Details" button on new job page

    Scenario: Attempt to create job without a start date
    When I check "Onsite" for work type
    And I select "full_time" for desired commitment
    And I select random estimated length
    And I click "Next - Required Skills" button on new job page
    Then I should see error message "You can't leave this empty" on step 2 page

  Scenario: Attempt to create job without estimated length
    When I check "Onsite" for work type
    And I select "full_time" for desired commitment
    And I set desired start date to today's date
    And I click "Next - Required Skills" button on new job page
    Then I should see error message "You can't leave this empty" on step 2 page

  Scenario: Attempt to create job without a spoken language
    When I check "Onsite" for work type
    And I set desired start date to today's date
    And I select random estimated length
    And I delete English from spoken languages
    And I click "Next - Required Skills" button on new job page
    Then I should see error message "You can't leave this empty" on step 2 page

