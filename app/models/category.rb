class Category < ApplicationRecord
  has_many :projects, dependent: :destroy
  mount_uploader :image, ImageUploader
end
