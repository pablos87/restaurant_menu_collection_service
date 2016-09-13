class MenuItem < ActiveRecord::Base
  belongs_to :menu_page, inverse_of: :menu_items
  belongs_to :dish, inverse_of: :menu_items
  
  validates :menu_page, :dish, presence: true
  validates :price, :high_price, numericality: { greater_than: 0 }, allow_blank: true
  validates :xpos, :ypos, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
end
