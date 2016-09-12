class Status < ActiveRecord::Base
  has_many :menus
  validates :name, presence: true, length: { maximum: 255 }
end
