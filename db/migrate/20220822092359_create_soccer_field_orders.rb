class CreateSoccerFieldOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :soccer_field_orders do |t|
      t.bigint :soccer_field_id
      t.bigint :user_id
      t.bigint :price
      t.datetime :time_finish
      t.datetime :time_start

      t.timestamps
    end
  end
end
