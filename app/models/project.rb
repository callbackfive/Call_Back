class Project < ApplicationRecord
  belongs_to :user
  has_many :givebacks
  accepts_nested_attributes_for :givebacks
end
