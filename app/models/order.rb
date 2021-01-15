class Order < ApplicationRecord
  belongs_to :user
  belongs_to :giveback  
  has_one :payment
  has_one :project, through: :giveback
  before_create :build_trade_no
 
  validates_presence_of :full_name, :delivery_country, :zip, :email, :message => ": 不可空白."
  validates :phone, format:{with: /\A09\d{8}\Z/,message:': 您的手機號碼需為10碼數字.'}

  enum status: [:order_received, :not_paid, :paid]

  def paid!
    self.issue_date = Time.now
    super
    project.reaching_goal
  end

  def self.to_csv
    attributes = %w{merchantOrderNo project_title giveback_title giveback_price issue_date status}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |order|
        csv << attributes.map{ |attr| order.send(attr) }
      end
    end
  end


  def status_to_string
    case status_before_type_cast
    when Order.statuses[:order_received]
      return "訂單已成立，尚未付款"
    when Order.statuses[:not_paid]
      return "未付款"
    when Order.statuses[:paid]
      return "已付款"
    else
      return "狀態未明"
    end
  end

  private
    def build_trade_no
      self.merchantOrderNo = "CallBack#{user.id.to_i}#{Time.zone.now.to_i}"
    end
end
