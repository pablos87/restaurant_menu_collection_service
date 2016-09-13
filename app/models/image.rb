class Image < ActiveRecord::Base
  has_many :menu_pages, inverse_of: :image
  validates :path, presence: true, length: { maximum: 255 }
end
