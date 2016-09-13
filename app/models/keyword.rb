class Keyword < ActiveRecord::Base
  has_and_belongs_to_many :menus
  validates :name, presence: true, length: { maximum: 255 }
end
