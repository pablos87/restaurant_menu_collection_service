class MenuPage < ActiveRecord::Base
  belongs_to :menu
  has_many :menu_items
  belongs_to :image

  validates :menu, presence: true
  validates :page_number, :full_height, :full_width, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :uuid, length: { is: 36 }, format: { with: /\A[0-9a-zA-Z]{8}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{12}\z/, message: "must be in format xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" }, allow_blank: true
end
