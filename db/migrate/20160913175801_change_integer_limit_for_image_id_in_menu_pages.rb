class ChangeIntegerLimitForImageIdInMenuPages < ActiveRecord::Migration
  def change
    change_column :menu_pages, :image_id, :integer, limit: 8
  end
end
