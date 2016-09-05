class CreateLocationTypes < ActiveRecord::Migration
  def change
    create_table :location_types do |t|

      t.timestamps null: false
    end
  end
end
