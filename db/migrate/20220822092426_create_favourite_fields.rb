class CreateFavouriteFields < ActiveRecord::Migration[6.1]
  def change
    create_table :favourite_fields do |t|
      t.bigint :user_id
      t.bigint :soccer_field_id

      t.timestamps
    end
  end
end
