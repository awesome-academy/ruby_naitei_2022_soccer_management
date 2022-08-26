class SoccerField < ApplicationRecord
  validates :name, presence: true,
                   length: {maximum: Settings.validates.name_max_length}

  validates :address, presence: true,
                      length: {maximum: Settings.validates.address_max_length}

  validates :field_type, :hour_price, presence: true,
                                      numericality: {only_integer: true}
end
