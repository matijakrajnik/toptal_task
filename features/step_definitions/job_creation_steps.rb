Given /^I am loged in$/ do
  visit(LoginPage, using_params: {base_url: @app['SITE']})
  on(LoginPage).set_timeout(@app['TIMEOUT'])
  on(LoginPage).login_with(@app['EMAIL'], @app['PASSWORD'])
end

And /^I follow "Add New Job" link ond dashboard page$/ do
  on(DashboardPage).new_job
  on(NewJobStep1Page).set_timeout(@app['TIMEOUT'])
  on(NewJobStep2Page).set_timeout(@app['TIMEOUT'])
  on(NewJobStep3Page).set_timeout(@app['TIMEOUT'])
  on(NewJobStep4Page).set_timeout(@app['TIMEOUT'])
  on(NewJobStep5Page).set_timeout(@app['TIMEOUT'])
end

When /^I type "(.+)" in title text field$/ do |title|
  on(NewJobStep1Page).type_title(title)
end

And /^I type "(.+)" in description text field$/ do |description|
  on(NewJobStep1Page).type_description(description)
end

And /^I click "(.+)" button on new job page$/ do |button|
  case button
  when "Next - Job Details"
    on(NewJobStep1Page).press_details
  when "Next - Required Skills"
    on(NewJobStep2Page).press_skills
  when "Next - Confirmation"
    on(NewJobStep3Page).press_confirmation
  when "Submit and See What's Next"
    on(NewJobStep4Page).press_submit
  end
end

And /^I check "(.+)" for work type$/ do |work_type|
  case work_type
  when "Remote"
    on(NewJobStep2Page).check_remote
  when "Onsite"
    on(NewJobStep2Page).check_onsite
  when "Mixed (Remote+Onsite)"
    on(NewJobStep2Page).check_mixed
  when "Recruiting Only"
    on(NewJobStep2Page).check_recruiting
  end
end

And /^I select random time length onsite$/ do
  on(NewJobStep2Page).select_time_length_onsite
end

And /^I select "(.+)" for desired commitment$/ do |commitment|
  on(NewJobStep2Page).select_desired_commitment(commitment)
end

And /^I check "(.+)" for time zone preference$/ do |time_zone_preference|
  on(NewJobStep2Page).set_time_zone_preference(time_zone_preference)
end

And /^I select "(.+)" for time zone$/ do |time_zone|
  on(NewJobStep2Page).select_time_zone(time_zone)
end

And /^I select "(.+)" for hours of overlap$/ do |overlap|
  on(NewJobStep2Page).select_hours_of_overlap(overlap)
end

And /^I set desired start date to (.+)$/ do |day|
  case day
  when "yesterday"
    date = (Date.today-1).strftime("%Y-%m-%d")
    on(NewJobStep2Page).set_start_date(date)
  when "today"
    date = Date.today.strftime("%Y-%m-%d")
    on(NewJobStep2Page).set_start_date(date)
  when "tomorrow"
    date = (Date.today+1).strftime("%Y-%m-%d")
    on(NewJobStep2Page).set_start_date(date)
  end
end

And /^I set invalid value "(.+)" for desired start date$/ do |date|
  on(NewJobStep2Page).set_start_date(date)
end

And /^I select random estimated length$/ do
  on(NewJobStep2Page).select_estimated_length
end

And /^I delete English from spoken languages$/ do
  on(NewJobStep2Page).click_delete_language
end

And /^I type "(.+)" in spoken languages field$/ do |language|
  on(NewJobStep2Page).type_spoken_language(language)
end

And /^I select "(.+)" from spoken languages dropdown menu$/ do |language|
  on(NewJobStep2Page).select_spoken_language(language)
end

And /^I type "(.+)" in languages field$/ do |language|
  on(NewJobStep3Page).type_language(language)
end

And /^I select "(.+)" from languages dropdown menu$/ do |language|
  on(NewJobStep3Page).select_language(language)
end

And /^I set rating to "(.+)"$/ do |rating|
  on(NewJobStep3Page).select_rating(rating)
end

And /^I type "(.+)" in frameworks field$/ do |framework|
  on(NewJobStep3Page).type_framework(framework)
end

And /^I select "(.+)" from frameworks dropdown menu$/ do |framework|
  on(NewJobStep3Page).select_framework(framework)
end

And /^I type "(.+)" in libraries field$/ do |librarie|
  on(NewJobStep3Page).type_librarie(librarie)
end

And /^I select "(.+)" from libraries dropdown menu$/ do |librarie|
  on(NewJobStep3Page).select_librarie(librarie)
end

And /^I type "(.+)" in tools field$/ do |tool|
  on(NewJobStep3Page).type_tool(tool)
end

And /^I select "(.+)" from tools dropdown menu$/ do |tool|
  on(NewJobStep3Page).select_tool(tool)
end

And /^I type "(.+)" in paradigms field$/ do |paradigm|
  on(NewJobStep3Page).type_paradigm(paradigm)
end

And /^I select "(.+)" from paradigms dropdown menu$/ do |paradigm|
  on(NewJobStep3Page).select_paradigm(paradigm)
end

And /^I type "(.+)" in platforms field$/ do |platform|
  on(NewJobStep3Page).type_platform(platform)
end

And /^I select "(.+)" from platforms dropdown menu$/ do |platform|
  on(NewJobStep3Page).select_platform(platform)
end

And /^I type "(.+)" in storage field$/ do |storage|
  on(NewJobStep3Page).type_storage(storage)
end

And /^I select "(.+)" from storage dropdown menu$/ do |storage|
  on(NewJobStep3Page).select_storage(storage)
end

And /^I type "(.+)" in misc field$/ do |misc|
  on(NewJobStep3Page).type_misc(misc)
end

And /^I select "(.+)" from misc dropdown menu$/ do |misc|
  on(NewJobStep3Page).select_misc(misc)
end

And /^I check (.+) checkbox$/ do |checkbox|
  case checkbox
  when "review"
    on(NewJobStep4Page).check_review_box
  when "notice"
    on(NewJobStep4Page).check_notice_box
  when "deposit"
    on(NewJobStep4Page).check_deposit_box
  end
end

And /^I uncheck (.+) checkbox$/ do |checkbox|
  case checkbox
  when "review"
    on(NewJobStep4Page).uncheck_review_box
  when "notice"
    on(NewJobStep4Page).uncheck_notice_box
  when "deposit"
    on(NewJobStep4Page).uncheck_deposit_box
  end
end

Then /^I should see message "(.+)"$/ do |message|
  on(NewJobStep5Page).complete_element.when_visible(@app['TIMEOUT'])
  on(NewJobStep5Page).complete.should eql message
end

Then /^I should see error message "(.+)" on step (\d) page$/ do |message, page|
  case page
  when 1
    on(NewJobStep1Page).error_element.when_visible(@app['TIMEOUT'])
    on(NewJobStep1Page).error.should eql message
  when 2
    on(NewJobStep2Page).error_element.when_visible(@app['TIMEOUT'])
    on(NewJobStep2Page).error.should eql message
  when 3
    on(NewJobStep3Page).error_element.when_visible(@app['TIMEOUT'])
    on(NewJobStep3Page).error.should eql message
  when 4
    on(NewJobStep4Page).error_element.when_visible(@app['TIMEOUT'])
    on(NewJobStep4Page).error.should eql message
  end
end

Then /^I should see (\d) error messages? "(.+)"$/ do |n, message|
  case n
  when 1
    on(NewJobStep4Page).error_0_element.when_visible(@app['TIMEOUT'])
    on(NewJobStep4Page).error_0.should eql message
  when 2
    on(NewJobStep4Page).error_0_element.when_visible(@app['TIMEOUT'])
    on(NewJobStep4Page).error_0.should eql message
    on(NewJobStep4Page).error_1_element.when_visible(@app['TIMEOUT'])
    on(NewJobStep4Page).error_1.should eql message
  end
end

And /^I click "Jump to Job" link$/ do
  on(CreatedJobPage).set_timeout(@app['TIMEOUT'])
  @page_url = on(NewJobStep5Page).jump_to_job_element.attribute("href")
  visit(CreatedJobPage, using_params: {path: @page_url})
end

Then /^I should be on page with created job details$/ do
  @browser.url.should eql @page_url
end

And /^I should see job with title "(.+)"$/ do |title|
  on(CreatedJobPage).title_element.when_visible(@app['TIMEOUT'])
  on(CreatedJobPage).title.should eql title
end

And /^I should see description "(.+)"$/ do |description|
  on(CreatedJobPage).description_element.when_visible(@app['TIMEOUT'])
  on(CreatedJobPage).description.should eql description
end

And /^I should see Mixed work type with selected random time length onsite$/ do
  time_onsite = on(NewJobStep2Page).get_time_onsite_option
  on(CreatedJobPage).time_onsite.should eql ("Mixed (" + time_onsite + " on-site)")
end

And /^I should see selected commitment$/ do
  commitment = on(NewJobStep2Page).get_commitment_option.split[0]
  on(CreatedJobPage).commitment.should eql commitment
end

And /^I should see selected time zone with selected hours of overlap$/ do
  time_zone = on(NewJobStep2Page).get_time_zone_option
  hours_of_overlap = on(NewJobStep2Page).get_hours_of_overlap_option
  time_zone = time_zone + ", min " + hours_of_overlap + " overlap" unless hours_of_overlap == ""
  on(CreatedJobPage).time_zone.should eql time_zone
end

And /^I should see selected (.+) for start date$/ do |day|
  case day
  when "yesterday"
    date = (Date.today-1).strftime("%B %-d, %Y")
  when "today"
    date = Date.today.strftime("%B %-d, %Y")
  when "tomorrow"
    date = (Date.today+1).strftime("%B %-d, %Y")
  end
  on(CreatedJobPage).start_date.should eql date
end

And /^I should see selected random estimated length$/ do
  on(CreatedJobPage).estimated_length.should eql on(NewJobStep2Page).get_estimated_length_option
end

And /^I should see "(.+)" in spoken languages section$/ do |language|
  on(CreatedJobPage).spoken_languages.should eql language
end

And /^I should see "(.+)" in language section with selected (.+)$/ do |language, rating|
  case rating
  when "Competent"
    on(CreatedJobPage).competent.should eql language
  when "Strong"
    on(CreatedJobPage).strong.should eql language
  when "Expert"
    on(CreatedJobPage).expert.should eql language
  end
end

And /^I should see "(.+)" in framework section$/ do |framework|
  on(CreatedJobPage).frameworks.should eql framework
end

And /^I should see "(.+)" in libraries section$/ do |librarie|
  on(CreatedJobPage).libraries.should eql librarie
end

And /^I should see "(.+)" in tools section$/ do |tool|
  on(CreatedJobPage).tools.should eql tool
end

And /^I should see "(.+)" in paradigms section$/ do |paradigm|
  on(CreatedJobPage).paradigms.should eql paradigm
end

And /^I should see "(.+)" in platforms section$/ do |platform|
  on(CreatedJobPage).platforms.should eql platform
end

And /^I should see "(.+)" in storage section$/ do |storage|
  on(CreatedJobPage).storage.should eql storage
end

And /^I should see "(.+)" in misc section$/ do |misc|
  on(CreatedJobPage).misc.should eql misc
end

