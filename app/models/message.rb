class Message < ApplicationRecord
  default_scope { order('id DESC') }

  validates :content, presence: true
  validates :dialogbox, presence: true
  
  belongs_to :user
  belongs_to :dialogbox

  acts_as_paranoid
end
