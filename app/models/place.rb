class Place < ActiveRecord::Base
  has_many :menus, inverse_of: :place
  has_many :events, through: :menus, inverse_of: :place
  validates :name, presence: true, length: { maximum: 255 }
end
