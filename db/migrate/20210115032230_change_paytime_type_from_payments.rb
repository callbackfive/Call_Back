class ChangePaytimeTypeFromPayments < ActiveRecord::Migration[6.0]
  def change
    change_column :payments, :payment_type, :string
  end
end
