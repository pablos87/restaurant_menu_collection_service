class Image < ActiveRecord::Base
  has_many :menu_pages
  validates :path, presence: true, length: { maximum: 255 }
end

