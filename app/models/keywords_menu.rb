class KeywordsMenu < ActiveRecord::Base
  belongs_to :menu
  belongs_to :keyword
end
