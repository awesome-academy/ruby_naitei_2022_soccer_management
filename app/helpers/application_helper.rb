module ApplicationHelper
  include Pagy::Frontend

  def full_title page_title = ""
    base_title = "Soccer Field"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end

  def gravatar_for object, options = {size: Settings.image.avatar.size}
    size = options[:size]
    gravatar_id = Digest::MD5.hexdigest(object.name)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: object.name, class: "gravatar")
  end
end
