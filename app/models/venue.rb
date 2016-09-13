class Venue < ActiveRecord::Base
  has_many :menus, inverse_of: :venue
  validates :name, presence: true, length: { maximum: 255 }
end
