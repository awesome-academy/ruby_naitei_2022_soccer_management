module ApplicationHelper
  include Pagy::Frontend

  def full_title page_title = ""
    base_title = "Soccer Field"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end
end
