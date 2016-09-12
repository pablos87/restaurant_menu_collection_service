class MenuItem < ActiveRecord::Base
  belongs_to :menu_page
  belongs_to :dish
  
  validates :menu_page, :dish, presence: true
  validates :price, :high_price, numericality: { greater_than: 0 }, allow_blank: true
  validates :xpos, :ypos, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
end
