class Giveback < ApplicationRecord
  belongs_to :project
  mount_uploader :image, ImageUploader
end
