class Order < ApplicationRecord
  belongs_to :user
  belongs_to :giveback
    
  has_one :payment
  has_one :project, through: :giveback

  before_create :build_trade_no

  private

    def build_trade_no
      self.merchant_order_no = "CallBack#{user.id.to_i}#{Time.zone.now.to_i}"
    end
end
