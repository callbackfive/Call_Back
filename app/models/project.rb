class Project < ApplicationRecord
  belongs_to :user
  has_many :dialogboxes
  belongs_to :category
  has_many :givebacks, inverse_of: :project
  has_many :comments, -> { where(parent_id: nil).order('created_at DESC') },dependent: :destroy
  has_many :orders, through: :givebacks
  has_many :paid_orders, through: :givebacks

  accepts_nested_attributes_for :givebacks, allow_destroy: true, reject_if: :all_blank
  mount_uploader :image, ImageUploader
  acts_as_paranoid

  enum status: [:is_hidden, :is_published ,:succeeded, :failed]
  scope :is_now_on_sale, -> {self.where(status:[:is_published,:succeeded]).where('due_date > ?', Time.now)}
  #在截止日之前達標
  scope :succeeded_and_done, -> {self.succeeded.where('due_date < ?', Time.now)}
  scope :past_projects, -> {self.where.not(status: [:is_hidden]).where('due_date < ?', Time.now)}


  def paid_orders_amounts  
    return paid_orders.inject(0) do |sum, order|
      sum += order.giveback_price
    end
  end

  def status_to_string
    case status_before_type_cast
    when Project.statuses[:is_hidden]
      return "尚未提交"
    when Project.statuses[:is_published]
      return "募資中"
    when Project.statuses[:succeeded]
      return "募資已成功"
    when Project.statuses[:failed] 
      return "募資失敗"
    else
      return "狀態未明"
    end
  end


end

# 元喬
# scope :participating_rooms, -> (user) dialogbox
#   where(sender: user, receiver: user)
# end

# find_or_create   ...Rails內建