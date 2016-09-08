class CreateCurrencySymbols < ActiveRecord::Migration
  def change
    create_table :currency_symbols do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
