class NewJobStep3Page
  include PageObject

  select(:rating, :class => "ui-tag__rating js-select_customized")
  text_field(:language, :id => "job_2_skill_sets")
  unordered_list(:languages_list, identifier = {:class => "js-autocomplete_wrap", :index => 0})
  text_field(:framework, :id => "job_3_skill_sets")
  unordered_list(:framework_list, identifier = {:class => "js-autocomplete_wrap", :index => 1})
  text_field(:librarie, :id => "job_4_skill_sets")
  unordered_list(:librarie_list, identifier = {:class => "js-autocomplete_wrap", :index => 2})
  text_field(:tool, :id => "job_5_skill_sets")
  unordered_list(:tool_list, identifier = {:class => "js-autocomplete_wrap", :index => 3})
  text_field(:paradigm, :id => "job_6_skill_sets")
  unordered_list(:paradigm_list, identifier = {:class => "js-autocomplete_wrap", :index => 4})
  text_field(:platforms, :id => "job_7_skill_sets")
  unordered_list(:platforms_list, identifier = {:class => "js-autocomplete_wrap", :index => 5})
  text_field(:storage, :id => "job_8_skill_sets")
  unordered_list(:storage_list, identifier = {:class => "js-autocomplete_wrap", :index => 6})
  text_field(:misc, :id => "job_9_skill_sets")
  unordered_list(:misc_list, identifier = {:class => "js-autocomplete_wrap", :index => 7})
  span(:error, :class => "base_error__body")
  button(:confirmation, identifier = {:class => "big_button", :index => 2})
  @@timeout

  def set_timeout (timeout)
    @@timeout = timeout
  end

  def press_confirmation
    confirmation_element.when_visible(@@timeout)
    confirmation
  end

  def select_rating (rating)
    self.rating = rating
  end

  def type_language (language)
    language_element.when_visible(@@timeout)
    self.language = language
  end

  def type_framework (framework)
    framework_element.when_visible(@@timeout)
    self.framework = framework
  end

  def type_librarie (librarie)
    librarie_element.when_visible(@@timeout)
    self.librarie = librarie
  end

  def type_tool (tool)
    tool_element.when_visible(@@timeout)
    self.tool = tool
  end

  def type_paradigm (paradigm)
    paradigm_element.when_visible(@@timeout)
    self.paradigm = paradigm
  end

  def type_platform (platform)
    platforms_element.when_visible(@@timeout)
    self.platforms = platform
  end

  def type_storage (storage)
    storage_element.when_visible(@@timeout)
    self.storage = storage
  end

  def type_misc (misc)
    misc_element.when_visible(@@timeout)
    self.misc = misc
  end

  def select_from_dropdown (list_element, pattern)
    sleep(2)
    for i in 0...list_element.items
      if list_element[i].attribute("data-value").include? "\"label\":\"" + pattern + "\""
        list_element[i].click
        break
      end
    end

  end

  def select_language (language)
    select_from_dropdown(languages_list_element, language)
  end

  def select_framework (framework)
    select_from_dropdown(framework_list_element, framework)
  end

  def select_librarie (librarie)
    select_from_dropdown(librarie_list_element, librarie)
  end

  def select_tool (tool)
    select_from_dropdown(tool_list_element, tool)
  end

  def select_paradigm (paradigm)
    select_from_dropdown(paradigm_list_element, paradigm)
  end

  def select_platform (platform)
    select_from_dropdown(platforms_list_element, platform)
  end

  def select_storage (storage)
    select_from_dropdown(storage_list_element, storage)
  end

  def select_misc (misc)
    select_from_dropdown(misc_list_element, misc)
  end
end
