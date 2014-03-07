Feature: Creating a job as a company user

  Background:
    Given I am loged in
    And I follow "Add New Job" link ond dashboard page

  Scenario Outline: Creating a mixed work type with time zone preference and all input fields
    When I type "Title with special characters !@#$%^&*()_+=-" in title text field
    And I type "Description with special characters !@#$%^&*()_+=-" in description text field
    And I click "Next - Job Details" button on new job page
    And I check "Mixed (Remote+Onsite)" for work type
    And I select random time length onsite
    And I select "<commitment>" for desired commitment
    And I check "Yes" for time zone preference
    And I select "<time zone>" for time zone
    And I select "<hours of overlap>" for hours of overlap
    And I set desired start date to <date>
    And I select random estimated length
    And I delete English from spoken languages
    And I type "Spanish" in spoken languages field
    And I select "Spanish" from spoken languages dropdown menu
    And I click "Next - Required Skills" button on new job page
    And I type "C#" in languages field
    And I select "C#" from languages dropdown menu
    And I set rating to "<rating>"
    And I type "Rails" in frameworks field
    And I select "Rails" from frameworks dropdown menu
    And I type "D3.js" in libraries field
    And I select "D3.js" from libraries dropdown menu
    And I type "Dev-C++" in tools field
    And I select "Dev-C++" from tools dropdown menu
    And I type "REST" in paradigms field
    And I select "REST" from paradigms dropdown menu
    And I type "Win32" in platforms field
    And I select "Win32" from platforms dropdown menu
    And I type "MySQL" in storage field
    And I select "MySQL" from storage dropdown menu
    And I type "Game Design" in misc field
    And I select "Game Design" from misc dropdown menu
    And I click "Next - Confirmation" button on new job page
    And I check review checkbox
    And I check notice checkbox
    And I check deposit checkbox
    And I click "Submit and See What's Next" button on new job page
    And I click "Jump to Job" link
    Then I should be on page with created job details
    And I should see job with title "Title with special characters !@#$%^&*()_+=-"
    And I should see description "Description with special characters !@#$%^&*()_+=-"
    And I should see Mixed work type with selected random time length onsite
    And I should see selected commitment
    And I should see selected time zone with selected hours of overlap
    And I should see selected <date> for start date
    And I should see selected random estimated length
    And I should see "Spanish" in spoken languages section
    And I should see "C#" in language section with selected <rating>
    And I should see "Rails" in framework section
    And I should see "D3.js" in libraries section
    And I should see "Dev-C++" in tools section
    And I should see "REST" in paradigms section
    And I should see "Win32" in platforms section
    And I should see "MySQL" in storage section
    And I should see "Game Design" in misc section

  Examples:


| commitment | date      | hours of overlap | rating    | time zone |
| part_time  | yesterday | 1 hour           | Competent | Tijuana   |
| part_time  | today     | 12 hours         | Expert    | Sydney    |
| part_time  | tomorrow  | 9 hours          | Strong    | Tokyo     |
| full_time  | yesterday | 12 hours         | Strong    | Singapore |
| full_time  | today     | 9 hours          | Competent | Mumbai    |
| full_time  | tomorrow  | 6 hours          | Expert    | Moscow    |
| hourly     | yesterday | 9 hours          | Expert    | Helsinki  |
| hourly     | today     | 6 hours          | Strong    | Zagreb    |
| hourly     | tomorrow  | 12 hours         | Competent | Dublin    |
| full_time  | tomorrow  | 1 hour           | Expert    | Zagreb    |
| hourly     | today     | 1 hour           | Strong    | Moscow    |
| part_time  | tomorrow  | 3 hours          | Strong    | Mumbai    |
| full_time  | today     | 3 hours          | Competent | Tokyo     |
| hourly     | yesterday | 3 hours          | Expert    | Azores    |
| part_time  | yesterday | 6 hours          | Competent | Santiago  |
| full_time  | tomorrow  | 6 hours          | Competent | Tijuana   |
| hourly     | today     | 3 hours          | Strong    | Tijuana   |
| part_time  | tomorrow  | 9 hours          | Expert    | Tijuana   |
| part_time  | tomorrow  | 12 hours         | Strong    | Tijuana   |
| part_time  | tomorrow  | 6 hours          | Competent | Arizona   |
| full_time  | today     | 3 hours          | Strong    | Arizona   |
| hourly     | yesterday | 1 hour           | Expert    | Arizona   |
| hourly     | today     | 9 hours          | Strong    | Arizona   |
| full_time  | today     | 12 hours         | Competent | Arizona   |
| full_time  | tomorrow  | 3 hours          | Strong    | Santiago  |
| hourly     | today     | 1 hour           | Strong    | Santiago  |
| full_time  | today     | 9 hours          | Expert    | Santiago  |
| hourly     | today     | 12 hours         | Strong    | Santiago  |
| part_time  | tomorrow  | 6 hours          | Strong    | Azores    |
| full_time  | today     | 1 hour           | Expert    | Azores    |
| hourly     | tomorrow  | 9 hours          | Strong    | Azores    |
| hourly     | today     | 12 hours         | Competent | Azores    |
| part_time  | today     | 3 hours          | Expert    | Dublin    |
| full_time  | yesterday | 1 hour           | Strong    | Dublin    |
| part_time  | today     | 6 hours          | Expert    | Dublin    |
| full_time  | tomorrow  | 9 hours          | Strong    | Dublin    |
| part_time  | yesterday | 3 hours          | Competent | Zagreb    |
| full_time  | yesterday | 9 hours          | Strong    | Zagreb    |
| hourly     | yesterday | 12 hours         | Competent | Zagreb    |
| part_time  | tomorrow  | 3 hours          | Competent | Helsinki  |
| full_time  | today     | 1 hour           | Competent | Helsinki  |
| part_time  | yesterday | 6 hours          | Strong    | Helsinki  |
| part_time  | today     | 12 hours         | Competent | Helsinki  |
| part_time  | yesterday | 3 hours          | Expert    | Moscow    |
| part_time  | tomorrow  | 9 hours          | Expert    | Moscow    |
| hourly     | tomorrow  | 12 hours         | Competent | Moscow    |
| hourly     | yesterday | 1 hour           | Competent | Mumbai    |
| part_time  | yesterday | 6 hours          | Expert    | Mumbai    |
| full_time  | tomorrow  | 12 hours         | Expert    | Mumbai    |
| part_time  | tomorrow  | 3 hours          | Strong    | Singapore |
| hourly     | today     | 1 hour           | Competent | Singapore |
| hourly     | yesterday | 6 hours          | Expert    | Singapore |
| hourly     | yesterday | 9 hours          | Competent | Singapore |
| hourly     | yesterday | 1 hour           | Competent | Tokyo     |
| full_time  | today     | 6 hours          | Competent | Tokyo     |
| part_time  | today     | 12 hours         | Expert    | Tokyo     |
| full_time  | tomorrow  | 3 hours          | Competent | Sydney    |
| hourly     | yesterday | 1 hour           | Competent | Sydney    |
| hourly     | today     | 6 hours          | Strong    | Sydney    |
| full_time  | tomorrow  | 9 hours          | Competent | Sydney    |
