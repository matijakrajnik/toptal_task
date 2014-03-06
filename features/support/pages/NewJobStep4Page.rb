class NewJobStep4Page
  include PageObject

  button(:submit, identifier = {:class => "big_button", :index => 3})
  checkbox(:review, :id => "new_job_accept_review")
  checkbox(:notice, :id => "new_job_accept_notice")
  checkbox(:deposit, :id => "new_job_accept_deposit")
  div(:error_0, identifier = {:class => "error__arrow_wrap", :index => 0})
  div(:error_1, identifier = {:class => "error__arrow_wrap", :index => 1})
  div(:error_2, identifier = {:class => "error__arrow_wrap", :index => 2})
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

  def uncheck_review_box
    review_element.when_visible(@@timeout)
    uncheck_review
  end

  def uncheck_notice_box
    notice_element.when_visible(@@timeout)
    uncheck_notice
  end

  def uncheck_deposit_box
    deposit_element.when_visible(@@timeout)
    uncheck_deposit
  end
end
