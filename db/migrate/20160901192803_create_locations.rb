class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.references :location_type, index: true
      t.timestamps null: false
    end
  end
end
