class Project < ApplicationRecord
  belongs_to :user
  has_many :givebacks, :inverse_of => :project
  accepts_nested_attributes_for :givebacks, allow_destroy: true, reject_if: :all_blank
  has_one :texting
end
