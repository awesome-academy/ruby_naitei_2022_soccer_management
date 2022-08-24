class SoccerFieldOrder < ApplicationRecord
  belongs_to :user
  belongs_to :soccer_field
  attr_accessor :time_start_picker, :time_finish_picker

  validate :validate_datetime

  def validate_datetime
    if begin
      self.time_start = DateTime.parse(time_start_picker)
    rescue StandardError
      ArgumentError
    end == ArgumentError
      errors.add(:time_start, I18n.t("soccer_field_orders.validate.start_time"))
    end
    if begin
      self.time_finish = DateTime.parse(time_finish_picker)
    rescue StandardError
      ArgumentError
    end == ArgumentError
      errors.add(:time_finish,
                 I18n.t("soccer_field_orders.validate.finish_time"))
    end

    compare_time
  end

  def compare_time
    if begin
      time_start < Time.current || time_start >= time_finish
    rescue StandardError
      ArgumentError
    end == ArgumentError
      errors.add(:time_start, I18n.t("soccer_field_orders.validate.start_time"))
    end
  end
end
