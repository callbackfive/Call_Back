class Project < ApplicationRecord
  belongs_to :user
  has_many :givebacks, inverse_of: :project
  has_many :comments, -> { where(parent_id: nil).order('created_at DESC') },dependent: :destroy
  has_many :orders, through: :givebacks
  accepts_nested_attributes_for :givebacks, allow_destroy: true, reject_if: :all_blank
  mount_uploader :image, ImageUploader
  acts_as_paranoid

    
  enum status: [:is_hidden, :is_published ,:succeeded, :failed]
  
  scope :is_now_on_sale, -> {self.where(status:[:is_published,:succeeded]).where('due_date > ?', Time.now)}
  scope :succeeded_and_done, -> {self.succeeded.where('due_date < ?', Time.now)}
  scope :past_projects, -> {self.where.not(status: [:is_hidden]).where('due_date < ?', Time.now)}


end
