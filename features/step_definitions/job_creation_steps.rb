Given /^I am loged in$/ do
  visit(LoginPage, using_params: {base_url: @app['SITE']})
  on(LoginPage).set_timeout(@app['TIMEOUT'])
  on(LoginPage).login_with(@app['EMAIL'], @app['PASSWORD'])
end

And /^I follow "Add New Job" link ond dashboard page$/ do
  on(DashboardPage).new_job
  on(NewJobPage).set_timeout(@app['TIMEOUT'])
end

When /^I type "(.+)" in title text field$/ do |title|
  on(NewJobPage).type_title(title)
end

And /^I type "(.+)" in description text field$/ do |description|
  on(NewJobPage).type_description(description)
end

And /^I click "(.+)" button on new job page$/ do |button|
  case button
  when "Next - Job Details"
    on(NewJobPage).press_details
  when "Next - Required Skills"
    on(NewJobPage).press_skills
  end
end

And /^I check "(.+)" for work type$/ do |work_type|
  case work_type
  when "Mixed (Remote+Onsite)"
    on(NewJobPage).check_mixed
  end
end

And /^I select random time length onsite$/ do
  on(NewJobPage).select_time_length_onsite
end

And /^I select "(.+)" for desired commitment$/ do |commitment|
  on(NewJobPage).select_desired_commitment(commitment)
end

