module Admin::SoccerFieldsHelper
  def field_type
    Settings.soccer_field.field_type.map{|n| [t(".#{n}-a-side"), n]}
  end
end
