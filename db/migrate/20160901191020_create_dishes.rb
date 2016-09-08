class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.integer :menus_appeared
      t.integer :times_appeared
      t.integer :first_appeared
      t.integer :last_appeared
      t.decimal :lowest_price, :decimal, precision: 8, scale: 2
      t.decimal :highest_price, :decimal, precision: 8, scale: 2
      
      t.timestamps null: false
    end
    add_index :dishes, :first_appeared
    add_index :dishes, :last_appeared
  end
end
