class Event < ActiveRecord::Base
  has_many :menus#, inverse_of: :event, autosave: true
end
