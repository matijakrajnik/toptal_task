class LoginPage
  include PageObject

  page_url "<%=params[:base_url]%>" + "users/login"
  text_field(:email, :id => "user_email")
  text_field(:password, :id => "user_password")
  button(:commit, :id => "sign_in_button")
  @@timeout

  def set_timeout (timeout)
    @@timeout = timeout
  end

  def login_with (email, password)
    email_element.when_visible(@@timeout)
    self.email = email
    password_element.when_visible(@@timeout)
    self.password = password
    commit
  end
end
