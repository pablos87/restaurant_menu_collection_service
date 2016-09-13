class Keyword < ActiveRecord::Base
  #has_many :keywords_menus, foreign_key: :keyword_id
  #has_many :menus, through: :keywords_menus
  has_and_belongs_to_many :menus
  validates :name, presence: true, length: { maximum: 255 }
end
