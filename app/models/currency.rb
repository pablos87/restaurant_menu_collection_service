class Currency < ActiveRecord::Base
  has_many :menus
  belongs_to :currency_symbol
  validates :name, presence: true, length: { maximum: 255 }
  validates :currency_symbol, presence: true
  
  alias :set_currency_symbol :currency_symbol=
  def currency_symbol=(c)
    currency_symbol = c.blank? ? nil : CurrencySymbol.find_or_initialize_by(name: c)
    set_currency_symbol(currency_symbol)
  end
end
