class Dialogbox < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :user, uniqueness: { scope: :project } 
end
