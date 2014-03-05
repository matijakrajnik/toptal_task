class NewJobStep2Page
  include PageObject

  radio_button(:remote, identifier = {:class => "radio_buttons required", :index => 0})
  radio_button(:onsite, identifier = {:class => "radio_buttons required", :index => 1})
  radio_button(:mixed, identifier = {:class => "radio_buttons required", :index => 2})
  radio_button(:recruiting, identifier = {:class => "radio_buttons required", :index => 3})
  radio_button(:time_zone_yes, :id => "job_prefer_timezone_yes")
  radio_button(:time_zone_no, :id => "job_prefer_timezone_no")
  select_list(:time_length_onsite, :id => "new_job_time_length_onsite")
  select_list(:commitment, :id => "new_job_commitment")
  select_list(:time_zone, :id => "new_job_time_zone_name")
  select_list(:overlap, :id => "new_job_hours_overlap")
  select_list(:estimated_length, :id => "new_job_estimated_length")
  text_field(:start_date, :id => "new_job_start_date")
  button(:skills, identifier = {:class => "big_button", :index => 1})
  @@timeout

  def set_timeout (timeout)
    @@timeout = timeout
  end

  def press_skills
    skills_element.when_visible(@@timeout)
    skills
  end

  def check_mixed
    mixed_element.when_visible(@@timeout)
    select_mixed
  end

  def select_time_length_onsite
    time_length_onsite_max_value = time_length_onsite_element.attribute("length").to_i - 2
    time = rand(0..time_length_onsite_max_value)
    time_length_onsite_element.select_value(time)
  end

  def select_desired_commitment (commitment)
    commitment_element.select_value(commitment)
  end

  def set_time_zone_preference (preference)
    if preference.casecmp("yes") == 0
      time_zone_yes_element.when_visible(@@timeout)
      select_time_zone_yes
    elsif preference.casecmp("no") == 0
      time_zone_no_element.when_visible(@@timeout)
      select_time_zone_no
    end
  end

  def select_time_zone (time_zone)
    time_zone_element.select_value(time_zone)
  end

  def select_hours_of_overlap (overlap)
    unless overlap.casecmp("No preference") == 0
      hours = overlap.split[0]
      overlap_element.select_value(hours)
    end
  end

  def set_start_date (date)
    start_date_element.when_visible(@@timeout)
    self.start_date = date
    start_date_element.send_keys(:tab)
  end

  def select_estimated_length
    estimated_length_max_value = estimated_length_element.attribute("length").to_i - 2
    length = rand(0..estimated_length_max_value)
    estimated_length_element.select_value(length)
  end
end
