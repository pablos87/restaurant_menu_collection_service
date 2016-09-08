class MenuPage < ActiveRecord::Base
  belongs_to :menu
  has_many :menu_items

  validates :menu_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :image_id, :page_number, :full_height, :full_width, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :uuid, length: { maximum: 255 }, format: { with: /\A[0-9a-zA-Z]{8}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{12}\z/, message: "must be in format xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" }, allow_blank: true
end
