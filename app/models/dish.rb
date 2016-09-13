class Dish < ActiveRecord::Base
  has_many :menu_items, inverse_of: :dish

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }, allow_blank: true
  validates :menus_appeared, :times_appeared, :first_appeared, :last_appeared,
            numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :lowest_price, :highest_price, numericality: { greater_than: 0 },
            allow_blank: true
end
