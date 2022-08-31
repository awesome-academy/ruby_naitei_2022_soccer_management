class SoccerField < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true,
                   length: {maximum: Settings.soccer_field.name_max_length}

  validates :address, presence: true,
                    length: {maximum: Settings.soccer_field.address_max_length}

  validates :field_type, :hour_price, presence: true,
                                      numericality: {only_integer: true}

  validates :image, content_type: {in: Settings.image.type,
                                   message: :valid_format},
                    size: {less_than: Settings.image.size.megabytes,
                           message: :should_less_than}

  def display_image
    image.variant resize_to_limit: Settings.image.resize_to_limit
  end

  def display_preview_image
    image.variant resize_to_limit: Settings.image.resize_to_limit_preview
  end
end
