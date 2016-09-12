class CreateMenuPages < ActiveRecord::Migration
  def change
    create_table :menu_pages do |t|
      t.references :menu, index: true
      t.integer :page_number
      t.integer :image_id
      t.integer :full_height
      t.integer :full_width
      t.string :uuid

      t.timestamps null: false
    end
  end
end
