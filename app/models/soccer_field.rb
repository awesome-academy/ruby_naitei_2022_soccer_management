class SoccerField < ApplicationRecord
  validates :name, presence: true,
                   length: {maximum: Settings.soccer_field.name_max_length}

  validates :address, presence: true,
                    length: {maximum: Settings.soccer_field.address_max_length}

  validates :field_type, :hour_price, presence: true,
                                      numericality: {only_integer: true}
  scope :search_name, ->(name){where("name LIKE ?", "%#{name}%")}
  scope :search_address, ->(address){where("address LIKE ?", "%#{address}%")}
end
