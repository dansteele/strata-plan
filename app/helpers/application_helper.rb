module ApplicationHelper

  def add_javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end

end
