class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :replies, -> { order('created_at ASC') }, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy

  validates :content, presence: :true
end
