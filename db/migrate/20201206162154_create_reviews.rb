class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :restaurant_id, null: false, foreign_key: true
      t.integer :rating
      t.string :dining_method
      t.text :comment

      t.timestamps
    end
  end
end
