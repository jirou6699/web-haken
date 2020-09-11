class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  
  validates :name, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader
end
