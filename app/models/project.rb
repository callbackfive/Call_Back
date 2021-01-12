class Project < ApplicationRecord
  belongs_to :user
  has_many :dialogboxes
  has_many :givebacks, inverse_of: :project
  has_many :comments, -> { where(parent_id: nil).order('created_at DESC') },dependent: :destroy
  accepts_nested_attributes_for :givebacks, allow_destroy: true, reject_if: :all_blank
  mount_uploader :image, ImageUploader
  acts_as_paranoid
end

# 元喬
# scope :participating_rooms, -> (user) dialogbox
#   where(sender: user, receiver: user)
# end

# find_or_create   ...Rails內建