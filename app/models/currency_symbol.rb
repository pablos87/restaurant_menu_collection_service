class CurrencySymbol < ActiveRecord::Base
  has_many :currencies, inverse_of: :currency_symbol

  validates :name, presence: true, length: { maximum: 255 }
end
