class Currency < ActiveRecord::Base
  has_many :menus, inverse_of: :currency
  belongs_to :currency_symbol, inverse_of: :currencies
  validates :name, presence: true, length: { maximum: 255 }
  validates :currency_symbol, presence: true
  
  alias :set_currency_symbol :currency_symbol=
  def currency_symbol=(c)
    currency_symbol = c.blank? ? nil : CurrencySymbol.find_or_initialize_by(name: c)
    set_currency_symbol(currency_symbol)
  end
end
