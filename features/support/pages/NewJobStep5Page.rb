class NewJobStep5Page
  include PageObject

  div(:complete, :class => "wizard_complete__title")
  @@timeout

  def set_timeout (timeout)
    @@timeout = timeout
  end
end
