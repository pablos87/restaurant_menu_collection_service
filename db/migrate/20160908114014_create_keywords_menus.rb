class CreateKeywordsMenus < ActiveRecord::Migration
  def change
    create_table :keywords_menus, id: false do |t|
      t.references :keyword, index: true
      t.references :menu, index: true
      t.timestamps null: false
    end
  end
end
