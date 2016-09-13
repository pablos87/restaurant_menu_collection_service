class ChangeIntegerLimitForIdInImages < ActiveRecord::Migration
  def change
    change_column :images, :id, :integer, limit: 8
  end
end
