class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :soccer_fields, :type, :field_type
  end
end
