class Order < ApplicationRecord
  belongs_to :user
  belongs_to :giveback
    
  has_one :payment
  has_one :project, through: :giveback

  before_create :build_trade_no

 
  validates_presence_of :full_name, :delivery_country, :zip, :email, :message => ": 不可空白."
  validates :phone, format:{with: /\A09\d{8}\Z/,message:': 您的手機號碼需為10碼數字.'}


  enum status: [:not_selected_yet, :not_paid, :paid, :canceled]

  def paid!
    self.issue_date = Time.now
    super
  end


  private

    def build_trade_no
      self.merchantOrderNo = "CallBack#{user.id.to_i}#{Time.zone.now.to_i}"
    end
end
