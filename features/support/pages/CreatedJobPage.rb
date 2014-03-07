class CreatedJobPage
  include PageObject

  page_url "<%=params[:path]%>"
  h2(:title, :class => "title__text")
  paragraph(:description, :class => "panel_list__text is-light")
  div(:time_onsite, identifier = {:class => "details__value", :index => 4})
  div(:estimated_length, identifier = {:class => "details__value", :index => 5})
  div(:commitment, identifier = {:class => "details__value", :index => 6})
  div(:start_date, identifier = {:class => "details__value", :index => 7})
  div(:time_zone, identifier = {:class => "details__value", :index => 8})
  div(:spoken_languages, identifier = {:class => "details__value", :index => 9})
  div(:languages, identifier = {:class => "details__value", :index => 10})
  div(:frameworks, identifier = {:class => "details__value", :index => 11})
  div(:libraries, identifier = {:class => "details__value", :index => 12})
  div(:tools, identifier = {:class => "details__value", :index => 13})
  div(:paradigms, identifier = {:class => "details__value", :index => 14})
  div(:platforms, identifier = {:class => "details__value", :index => 15})
  div(:storage, identifier = {:class => "details__value", :index => 16})
  div(:misc, identifier = {:class => "details__value", :index => 17})
  div(:competent, :class => "ui-tag has-rank_competent")
  div(:strong, :class => "ui-tag has-rank_strong")
  div(:expert, :class => "ui-tag has-rank_expert")
  @@timeout

  def set_timeout (timeout)
    @@timeout = timeout
  end
end
