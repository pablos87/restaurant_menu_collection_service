class Location < ActiveRecord::Base
  has_many :menus
  belongs_to :location_type

  alias_method :set_location_type, :location_type=
  def location_type=(l)
    location_type = l.blank? ? nil : LocationType.find_or_initialize_by(name: l)
    set_location_type(location_type)
  end
end
