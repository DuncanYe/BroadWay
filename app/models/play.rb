class Play < ApplicationRecord
  validates_presence_of :title, :description, :director

  belongs_to :user
  belongs_to :category
end
