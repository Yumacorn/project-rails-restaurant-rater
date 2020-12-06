class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :city
      t.string :state
      t.boolean :dine_in
      t.boolean :take_out

      t.timestamps
    end
  end
end
