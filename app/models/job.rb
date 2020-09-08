class Job < ApplicationRecord
  mount_uploader :image1, ImageUploader
end
