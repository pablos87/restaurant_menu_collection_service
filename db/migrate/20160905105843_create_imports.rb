class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|

      t.timestamps null: false
    end
  end
end
