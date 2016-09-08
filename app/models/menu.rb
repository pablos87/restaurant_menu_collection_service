class Menu < ActiveRecord::Base
  attr_accessor :location_type, :currency_symbol

  belongs_to :sponsor
  belongs_to :event#, inverse_of: :menus, autosave: true
  belongs_to :venue
  belongs_to :place
  belongs_to :occasion
  belongs_to :language
  belongs_to :location
  belongs_to :currency
  belongs_to :status
  has_many :keywords_menus
  has_many :keywords, through: :keywords_menus
  has_many :menu_pages

  validates :name, length: { maximum: 255 }, allow_blank: true
  validates :sponsor_id, :event_id, :venue_id, :place_id, :occasion_id, :language_id, :currency_id, :location_id, :status_id, numericality: { greater_than: 0 }, allow_blank: true 
  validates :physical_description, length: { maximum: 255 }, allow_blank: true
  validates :notes, length: { maximum: 1000 }, allow_blank: true
  validates :date, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: 'must be in format yyyy-mm-dd' }, allow_blank: true
  validates :page_count, :dish_count, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

  alias_method :set_sponsor, :sponsor=
  def sponsor=(s)
    sponsor = Sponsor.find_or_initialize_by(name: s)
    set_sponsor(sponsor)
  end

  alias_method :set_event, :event=
  def event=(e)
    event = Event.find_or_initialize_by(name: e)
    set_event(event)
  end

  alias_method :set_venue, :venue=
  def venue=(v)
    venue = Venue.find_or_initialize_by(name: v)
    set_venue(venue)
  end

  alias_method :set_place, :place=
  def place=(p)
    place = Place.find_or_initialize_by(name: p)
    set_place(place)
  end

  alias_method :set_occasion, :occasion=
  def occasion=(o)
    occasion = Occasion.find_or_initialize_by(name: o)
    set_occasion(occasion)
  end

  alias_method :set_language, :language=
  def language=(l)
    language = Language.find_or_initialize_by(name: l)
    set_language(language)
  end

  alias_method :set_location, :location=
  def location=(l)
     location = Location.find_or_initialize_by(name: l, location_type: location_type)
     set_location(location)
  end

  def location_type
    if location
      location.location_type
    else
      @location_type
    end
  end

  alias_method :set_location_type, :location_type=
  def location_type=(l)
     if location.blank?
       @location_type = l
     else
       self.location.location_type = l
     end
  end

  alias_method :set_currency, :currency=
  def currency=(c)
    currency = Currency.find_or_initialize_by(name: c, currency_symbol: currency_symbol)
    set_currency(currency)
  end

  def currency_symbol
    if currency
      currency.currency_symbol
    else
      @currency_symbol
    end
  end

  alias_method :set_currency_symbol, :currency_symbol=
  def currency_symbol=(c)
    if currency.blank?
      @currency_symbol = c
    else
      self.currency.currency_symbol = c
    end
  end
  
  alias_method :set_status, :status=
  def status=(s)
    status = Status.find_or_initialize_by(name: s)
    set_status(status)
  end

  def keywords=(k)
    unless k.blank?
      words = k.split(',')
      words.each do |w|
 	word = Keyword.find_or_initialize_by(name: w)
        self.keywords << word
      end
    end
  end
end
