class Project < ApplicationRecord
  belongs_to :user
  has_many :givebacks, inverse_of: :project
  has_many :comments, -> { where(parent_id: nil).order('created_at DESC') }
  accepts_nested_attributes_for :givebacks, allow_destroy: true, reject_if: :all_blank
end
