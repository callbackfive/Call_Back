class RemoveColumnFromPayments < ActiveRecord::Migration[6.0]
  def change
    remove_column :payments, :unpaid_payment_expire_date
    remove_column :payments, :transaction_service_provider
    
  end
end
