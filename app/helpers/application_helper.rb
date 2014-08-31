module ApplicationHelper

  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end

  def page_title(separator = "-")
    ['HungryBrains', content_for(:title)].compact.join(separator)
  end

  def flash_class(level)
    case level
      when "notice" then "alert alert-info"
      when "success" then "alert alert-success"
      when "error" then "alert alert-danger"
      when "alert" then "alert alert-warning"
      else "alert #{level}"
    end
  end

  def pagination_links(collection, options = {})
    options[:renderer] ||= "BootstrapPagination::Rails"
    options[:class] ||= 'pagination pagination-centered'
    options[:inner_window] ||= 2
    options[:outer_window] ||= 1
    options[:next_label] ||= "Следующая"
    options[:previous_label] ||= "Предыдущая"
    will_paginate(collection, options)
  end

end
