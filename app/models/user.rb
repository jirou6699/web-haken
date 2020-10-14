class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :contacts
  has_many :favorites, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  mount_uploader :image, ImageUploader


  def already_favorited?(job)
    self.favorites.exists?(job_id: job.id)
  end
end
