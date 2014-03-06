Feature: Creating a job as a company user

  Background:
    Given I am loged in
    And I follow "Add New Job" link ond dashboard page

  Scenario: Creating a mixed work type with time zone preference and all input fields
    When I type "Test" in title text field
    And I type "Description" in description text field
    And I click "Next - Job Details" button on new job page
    And I check "Mixed (Remote+Onsite)" for work type
    And I select random time length onsite
    And I select "full_time" for desired commitment
    And I check "Yes" for time zone preference
    And I select "Zagreb" for time zone
    And I select "2 hours" for hours of overlap
    And I set desired start date to today's date
    And I select random estimated length
    And I delete English from spoken languages
    And I type "Spanish" in spoken languages field
    And I select "Spanish" from spoken languages dropdown menu
    And I click "Next - Required Skills" button on new job page
    And I type "Ruby" in languages field
    And I select "Ruby" from languages dropdown menu
    And I set rating to "Strong"
    And I type "Rails" in frameworks field
    And I select "Rails" from frameworks dropdown menu
    And I type "Facebook API" in libraries field
    And I select "Facebook API" from libraries dropdown menu
    And I type "Eclipse" in tools field
    And I select "Eclipse" from tools dropdown menu
    And I type "Extreme programming" in paradigms field
    And I select "Extreme programming" from paradigms dropdown menu
    And I type "Linux" in platforms field
    And I select "Linux" from platforms dropdown menu
    And I type "MySQL" in storage field
    And I select "MySQL" from storage dropdown menu
    And I type "Games" in misc field
    And I select "Games" from misc dropdown menu
    And I click "Next - Confirmation" button on new job page
    And I check review checkbox
    And I check notice checkbox
    And I check deposit checkbox
    And I click "Submit and See What's Next" button on new job page
    Then I should see message "Congratulations — you've just added a new job!"

