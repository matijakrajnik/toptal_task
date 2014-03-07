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
    And I set desired start date to today
    And I click "Next - Required Skills" button on new job page
    Then I should see error message "You can't leave this empty" on step 2 page

  Scenario: Attempt to create job without a spoken language
    When I check "Onsite" for work type
    And I select "full_time" for desired commitment
    And I set desired start date to today
    And I select random estimated length
    And I delete English from spoken languages
    And I click "Next - Required Skills" button on new job page
    Then I should see error message "You can't leave this empty" on step 2 page

  Scenario: Attempt to create mixed work type without selecting time length onsite
    When I check "Mixed (Remote+Onsite)" for work type
    And I select "full_time" for desired commitment
    And I set desired start date to today
    And I select random estimated length
    And I click "Next - Required Skills" button on new job page
    Then I should see error message "You can't leave this empty" on step 2 page

  Scenario: Attempt to create job with time zone preference but without selecting time zone
    When I check "Remote" for work type
    And I select "full_time" for desired commitment
    And I check "Yes" for time zone preference
    And I select "2 hours" for hours of overlap
    And I set desired start date to today
    And I select random estimated length
    And I click "Next - Required Skills" button on new job page
    Then I should see error message "You can't leave this empty" on step 2 page

  Scenario Outline: Attempt to create job with invalid date
    When I check "Onsite" for work type
    And I select "full_time" for desired commitment
    And I set invalid value "<invalid date>" for desired start date
    And I select random estimated length
    And I click "Next - Required Skills" button on new job page
    Then I should see error message "You can't leave this empty" on step 2 page
  Examples:
      | invalid date  |
      | 2014-00-01    |
      | 2014-13-01    |
      | 2014-01-00    |
      | 2014-01-32    |
      | 2014-02-29    |
      | 0-01-01       |

  Scenario: Attempt to save job with too large year
    When I check "Onsite" for work type
    And I select "full_time" for desired commitment
    And I set invalid value "5874898-01-01" for desired start date
    And I select random estimated length
    And I click "Next - Required Skills" button on new job page
    And I type "Ruby" in languages field
    And I select "Ruby" from languages dropdown menu
    And I type "Rails" in frameworks field
    And I select "Rails" from frameworks dropdown menu
    And I click "Next - Confirmation" button on new job page
    And I check review checkbox
    And I check notice checkbox
    And I check deposit checkbox
    And I click "Submit and See What's Next" button on new job page
    Then I should see message "Congratulations — you've just added a new job!"

