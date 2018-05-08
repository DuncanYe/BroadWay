class Play < ApplicationRecord
  validates_presence_of :title, :description, :director

  belongs_to :user
  belons_to :category
end
