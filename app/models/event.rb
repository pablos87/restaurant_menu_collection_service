class Event < ActiveRecord::Base
  has_many :menus#, inverse_of: :event, autosave: true

  validates :name, presence: true, length: { maximum: 255 }
end
