class Sponsor < ActiveRecord::Base
  has_many :menus, inverse_of: :sponsor

  validates :name, presence: true, length: { maximum: 255 }
end
