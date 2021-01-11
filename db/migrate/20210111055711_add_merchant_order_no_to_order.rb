class AddMerchantOrderNoToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :merchantOrderNo, :string

  end
end
