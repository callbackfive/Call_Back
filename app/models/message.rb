class Message < ApplicationRecord
  validates :content, presence: true
  validates :dialogbox, presence: true
  
  belongs_to :user
  belongs_to :dialogbox
end
