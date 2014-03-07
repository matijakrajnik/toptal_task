class NewJobPage
  include PageObject

  page_url "<%=params[:base_url]%>" + "platform/company/jobs/new"
end
