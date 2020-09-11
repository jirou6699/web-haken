class Job < ApplicationRecord
  mount_uploader :image1, ImageUploader

  def self.search(search)
    if search != ""
      Job.where('title LIKE(?)', "%#{search}%")
    else
      Job.all
    end
  end
end
