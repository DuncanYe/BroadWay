class Play < ApplicationRecord
  validates_presence_of :title, :description, :director
end
