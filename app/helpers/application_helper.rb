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

end
