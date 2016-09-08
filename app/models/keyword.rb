class Keyword < ActiveRecord::Base
  has_many :keyword_menus
  has_many :menus, through: :keywords_menus
end
