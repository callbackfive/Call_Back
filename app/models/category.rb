class Category < ApplicationRecord
  has_many :projects
  mount_uploader :image, ImageUploader
end
