class Payment < ApplicationRecord
    belongs_to :order
    
    acts_as_paranoid
    enum status: [:not_paid_yet, :paid, :canceled_before_paid, :wating_for_refund, :canceled_and_refounded]
    
    enum transaction_service_provider: [:mpg]
    enum payment_type: [:credit_card, :cvs, :bar_code, :atm, :web_atm]
  
    validates :merchant_order_no, presence: true
    
    validates_numericality_of :end_price, greater_or_equal_to: 0
  
    def paid!
      self.paid_date = Time.now
      super
    end
  end
  