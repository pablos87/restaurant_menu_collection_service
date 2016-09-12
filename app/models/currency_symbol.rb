class CurrencySymbol < ActiveRecord::Base
  has_many :currencies

  validates :name, presence: true, length: { maximum: 255 }
end
