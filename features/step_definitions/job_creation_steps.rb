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
  when "Mixed (Remote+Onsite)"
    on(NewJobStep2Page).check_mixed
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

And /^I set desired start date to today's date$/ do
  today = Date.today.strftime("%Y-%m-%d")
  on(NewJobStep2Page).set_start_date(today)
end

And /^I select random estimated length$/ do
  on(NewJobStep2Page).select_estimated_length
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

Then /^I should see message "(.+)"$/ do |message|
  on(NewJobStep5Page).complete_element.when_visible(@app['TIMEOUT'])
  on(NewJobStep5Page).complete.should eql message
end

