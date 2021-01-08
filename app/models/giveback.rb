class Giveback < ApplicationRecord
  belongs_to :project
  has_many :orders

  mount_uploader :image, ImageUploader
  acts_as_paranoid
end
