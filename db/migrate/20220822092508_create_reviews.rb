class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.bigint :user_id
      t.bigint :soccer_filed_id
      t.integer :rate
      t.text :content

      t.timestamps
    end
  end
end
