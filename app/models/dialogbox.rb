class Dialogbox < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :messages

  validates :user, uniqueness: { scope: :project }
end
