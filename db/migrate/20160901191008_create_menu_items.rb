class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.references :menu_page, index: true
      t.decimal :price, :decimal, precision: 8, scale: 2
      t.decimal :high_price,:decimal, precision: 8, scale: 2
      t.references :dish, index:true
      t.float :xpos
      t.float :ypos

      t.timestamps null: false
    end
  end
end
