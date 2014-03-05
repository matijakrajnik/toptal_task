class NewJobStep4Page
  include PageObject

  button(:submit, identifier = {:class => "big_button", :index => 3})
  checkbox(:review, :id => "new_job_accept_review")
  checkbox(:notice, :id => "new_job_accept_notice")
  checkbox(:deposit, :id => "new_job_accept_deposit")
  @@timeout

  def set_timeout (timeout)
    @@timeout = timeout
  end

  def press_submit
    submit_element.when_visible(@@timeout)
    submit
  end

  def check_review_box
    review_element.when_visible(@@timeout)
    check_review
  end

  def check_notice_box
    notice_element.when_visible(@@timeout)
    check_notice
  end

  def check_deposit_box
    deposit_element.when_visible(@@timeout)
    check_deposit
  end
end
