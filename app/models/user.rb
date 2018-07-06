class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :intro, presence: true
  mount_uploader :avatar, AvatarUploader

   has_many :plays, dependent: :destroy
   has_many :reviews, dependent: :destroy

   def admin?
     self.role = "admin"
   end
end
