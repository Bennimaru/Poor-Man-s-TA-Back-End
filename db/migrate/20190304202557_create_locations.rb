class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :image
      t.string :address
      t.string :description
      t.integer :borough_id
      t.timestamps
    end
  end
end
