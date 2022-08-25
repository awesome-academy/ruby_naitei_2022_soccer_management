module SoccerFieldsHelper
  def gravatar_for soccer_field, options = {size: Settings.image.avatar.size}
    size = options[:size]
    gravatar_id = Digest::MD5.hexdigest(soccer_field.name)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: soccer_field.name, class: "gravatar")
  end
end
