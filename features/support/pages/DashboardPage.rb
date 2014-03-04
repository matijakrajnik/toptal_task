class DashboardPage
  include PageObject

  page_url "<%=params[:base_url]%>" + "platform/company/dashboard"
  link(:new_job, :href => "/platform/company/jobs/new")
  @@timeout

  def set_timeout (timeout)
    @@timeout = timeout
  end

end
