class LocationType < ActiveRecord::Base
  has_many :locations, inverse_of: :location_type

  validates :name, presence: true, length: { maximum: 255 }
end
