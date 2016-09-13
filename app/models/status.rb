class Status < ActiveRecord::Base
  has_many :menus, inverse_of: :status
  validates :name, presence: true, length: { maximum: 255 }
end
