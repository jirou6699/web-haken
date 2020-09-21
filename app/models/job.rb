class Job < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader
  mount_uploader :image5, ImageUploader

  def self.search(search)
    if search != ""
      Job.where('title LIKE(?)', "%#{search}%")
    else
      Job.all
    end
  end
end
