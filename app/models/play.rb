class Play < ApplicationRecord
  validates_presence_of :title, :description, :director

  belongs_to :user
  belongs_to :category
  has_many :reviews

  has_attached_file :play_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :play_img, content_type: /\Aimage\/.*\z/
end
