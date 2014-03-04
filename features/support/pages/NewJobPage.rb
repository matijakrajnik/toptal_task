class NewJobPage
  include PageObject

  page_url "<%=params[:base_url]%>" + "platform/company/jobs/new"
  text_field(:title, :id => "new_job_title")
  text_area(:description, :id => "new_job_description")
  button(:details, :class => "big_button")
  radio_button(:remote, identifier = {:class => "radio_buttons required", :index => 0})
  radio_button(:onsite, identifier = {:class => "radio_buttons required", :index => 1})
  radio_button(:mixed, identifier = {:class => "radio_buttons required", :index => 2})
  radio_button(:recruiting, identifier = {:class => "radio_buttons required", :index => 3})
  select_list(:time, :id => "new_job_time_length_onsite")
  select_list(:commitment, :id => "new_job_commitment")
  select_list(:estimated_length, :id => "new_job_estimated_length")
  @@timeout

  def set_timeout (timeout)
    @@timeout = timeout
  end

  def type_title (title)
    title_element.when_visible(@@timeout)
    self.title = title
  end

  def type_description (description)
    description_element.when_visible(@@timeout)
    self.description = description
  end

  def press_details
    details_element.when_visible(@@timeout)
    details
  end

  def check_mixed
    mixed_element.when_visible(@@timeout)
    select_mixed
  end

  def select_time_length_onsite
    sleep (5)
    10.times {time_element.flash}
    time_element.when_visible(@@timeout)
    require 'debugger'
    debugger
    puts 'x'
  end

  def select_desired_commitment (commitment)
    sleep (5)
    10.times {commitment_element.flash }
    commitment_element.when_visible(@@timeout)
    commitment_element.select_value(commitment)
  end
end
