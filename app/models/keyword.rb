class Keyword < ActiveRecord::Base
  has_many :keywords_menus
  has_many :menus, through: :keywords_menus

  validates :name, presence: true, length: { maximum: 255 }
end
