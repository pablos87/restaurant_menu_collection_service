class Occasion < ActiveRecord::Base
   has_many :menus, inverse_of: :occasion

   validates :name, presence: true, length: { maximum: 255 }
end
