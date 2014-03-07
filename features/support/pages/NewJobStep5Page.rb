class NewJobStep5Page
  include PageObject

  div(:complete, :class => "wizard_complete__title")
  link(:jump_to_job, :class => "big_button js-goto-job")
  @@timeout

  def set_timeout (timeout)
    @@timeout = timeout
  end

end
