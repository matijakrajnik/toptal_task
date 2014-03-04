Feature: Creating a job as a company user

  Background:
    Given I am loged in
    And I follow "Add New Job" link ond dashboard page

  Scenario: Creating a mixed work type with time zone preference and all input fields
    When I type "Test" in title text field
    And I type "Description" in description text field
    And I click "Next - Job Details" button on new job page
    #And I check "Mixed (Remote+Onsite)" for work type
    #And I select random time length onsite
    And I select "part_time" for desired commitment
    And I check "Yes" for time zone preference
    And I select "Zagreb" for time zone
    And I select random hours of overlap
    And I set desired start date to today's date
    And I set random estimated length
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

