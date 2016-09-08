class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.references :sponsor, index: true
      t.references :event, index: true
      t.references :venue, index: true
      t.references :place, index: true
      t.string :physical_description
      t.references :occasion, index: true
      t.text :notes
      t.string :call_number
      t.references :language, index: true
      t.date :date
      t.references :location, index: true
      t.references :currency, index: true
      t.references :status, index: true
      t.integer :page_count
      t.integer :dish_count
 
      t.timestamps null: false
    end
  end
end
