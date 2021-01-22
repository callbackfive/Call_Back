class Message < ApplicationRecord
  default_scope { order('id DESC') }
  # TODO message跳出順序調整相反


  validates :content, presence: true
  validates :dialogbox, presence: true
  
  belongs_to :user
  belongs_to :dialogbox
end
