class Language < ActiveRecord::Base
  has_many :menus, inverse_of: :language

  validates :name, presence: true, length: { maximum: 255 }
end
