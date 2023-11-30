module ApplicationHelper
  def current_page_class(path)
    'active' if current_page?(path)
  end
end
