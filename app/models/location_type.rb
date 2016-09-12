class LocationType < ActiveRecord::Base
  has_many :locations

  validates :name, presence: true, length: { maximum: 255 }
end
