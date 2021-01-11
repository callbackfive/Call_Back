class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.belongs_to  :order
      t.string      :merchant_order_no
      t.integer     :end_price
      t.integer     :status, default: 0, null: false
      t.datetime    :paid_date
      t.datetime    :unpaid_payment_expire_date
      t.integer     :transaction_service_provider
      t.string      :third_party_payment_id
      t.string      :time_stamp
      t.integer     :payment_type
      t.string      :bank_code
      t.string      :code_no
      t.string      :cvs_code
      t.string      :buyer_account_code
      t.string      :payment_type_charging_fee
      t.string      :credit_card_number
      t.string      :auth
      t.string      :inst
      t.string      :inst_first
      t.string      :inst_each
      t.timestamps
    end
  end
end
