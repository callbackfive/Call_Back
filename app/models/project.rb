class Project < ApplicationRecord
  belongs_to :user
  has_many :dialogboxes, dependent: :destroy
  belongs_to :category
  has_many :givebacks, inverse_of: :project, dependent: :destroy
  has_many :comments, -> { where(parent_id: nil).order('created_at DESC') },dependent: :destroy
  has_many :orders, through: :givebacks, dependent: :destroy
  has_many :favorite_projects
  has_many :fav_users, through: :fav_projects, source: 'user'
  has_many :paid_orders, through: :givebacks
  has_rich_text :content

  accepts_nested_attributes_for :givebacks, allow_destroy: true, reject_if: :all_blank
  mount_uploader :image, ImageUploader
  acts_as_paranoid

  extend FriendlyId
  friendly_id :title, use: :slugged

  #在project new頁面的驗證
  attr_accessor :new_project_validation
  validates :title, presence: true, if: -> {new_project_validation} 

  #在project edit頁面的驗證
  attr_accessor :edit_project_validation
  validates :title, :image, :summary, :content, :target_amount, :due_date,:givebacks, presence: true, if: -> {edit_project_validation} 

  #已經發布的專案的edit頁面驗證
  attr_accessor :is_published_project_validation
  validates :image, :summary, :content, presence: true, if: -> {is_published_project_validation}

  enum status: [:is_hidden, :is_published ,:succeeded, :failed]
  scope :is_now_on_sale, -> {self.where(status:[:is_published,:succeeded]).where('due_date > ?', Time.now)}
  scope :succeeded_and_done, -> {self.succeeded.where('due_date < ?', Time.now)}
  scope :past_projects, -> {self.where.not(status: [:is_hidden]).where('due_date < ?', Time.now)}


  def paid_orders_amounts
    return paid_orders.inject(0) do |sum, order|
      sum += order.giveback_price
    end
  end
 
  def reaching_goal
    if self.is_published? && (self.paid_orders_amounts >= self.target_amount)
      self.succeeded!
    end
  end

  def percentage_of_reaching_goal
    paid_orders_amounts.to_f / target_amount.to_f
  end

  def days_left
    (due_date.to_i - Time.now.to_i) / (60 * 60 * 24) 
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
