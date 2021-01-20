class RemoveColumnCreditcardInfoFromPayments < ActiveRecord::Migration[6.0]
  def change
    remove_column :payments, :payment_type_charging_fee
    remove_column :payments, :credit_card_number
  end
end
