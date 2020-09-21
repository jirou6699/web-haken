class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  
  validates :name, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  mount_uploader :image, ImageUploader

  has_many :favorites, dependent: :destroy

  def already_favorited?(recipe)
    self.favorites.existes?(recipe_id: recipe.id)
  end
end
