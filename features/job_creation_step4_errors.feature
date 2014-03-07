Feature: Not checking necessary checkboxes in job creation step 4 should produce error message

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
    And I type "Ruby" in languages field
    And I select "Ruby" from languages dropdown menu
    And I set rating to "Strong"
    And I type "Rails" in frameworks field
    And I select "Rails" from frameworks dropdown menu
    And I click "Next - Confirmation" button on new job page

  Scenario Outline: Attempt to create job without checking all checkboxex
    When I <review> review checkbox
    And I <notice> notice checkbox
    And I <deposit> deposit checkbox
    And I click "Submit and See What's Next" button on new job page
    Then I should see <messages> error messages "You need to confirm this"
    Examples:
      | review  | notice  | deposit | messages |
      | check   | check   | uncheck |    1     |
      | check   | uncheck | check   |    1     |
      | uncheck | check   | check   |    1     |
      | check   | uncheck | uncheck |    2     |
      | uncheck | check   | uncheck |    2     |
      | uncheck | uncheck | check   |    2     |
      | uncheck | uncheck | uncheck |    3     |

