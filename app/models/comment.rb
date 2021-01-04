class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy

  validates :content, presence: :true
  
  #讓最新的留言在最上面
  default_scope { order('created_at DESC') }
end