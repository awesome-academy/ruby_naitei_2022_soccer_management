class CreateSoccerFields < ActiveRecord::Migration[6.1]
  def change
    create_table :soccer_fields do |t|
      t.string :name
      t.string :address
      t.integer :type
      t.integer :rate
      t.bigint :hour_price

      t.timestamps
    end
  end
end
