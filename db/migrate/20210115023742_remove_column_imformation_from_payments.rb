class RemoveColumnImformationFromPayments < ActiveRecord::Migration[6.0]
  def change
    remove_column :payments, :third_party_payment_id
    remove_column :payments, :bank_code
    remove_column :payments, :code_no
    remove_column :payments, :cvs_code
    remove_column :payments, :auth
    remove_column :payments, :buyer_account_code
    remove_column :payments, :time_stamp

  end
end
