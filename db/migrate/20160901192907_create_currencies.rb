class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.references :currency_symbol, index: true
      t.timestamps null: false
    end
  end
end
