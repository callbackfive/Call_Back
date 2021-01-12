class Giveback < ApplicationRecord
  belongs_to :project
  has_many :orders
  has_many :paid_orders, -> { where(status: [:paid])}, class_name: 'Order'

  mount_uploader :image, ImageUploader
  acts_as_paranoid
end
