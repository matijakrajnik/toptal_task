class NewJobStep1Page
  include PageObject

  text_field(:title, :id => "new_job_title")
  text_area(:description, :id => "new_job_description")
  div(:error, :class => "error is-big is-new_job")
  button(:details, identifier = {:class => "big_button", :index => 0})
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
end
