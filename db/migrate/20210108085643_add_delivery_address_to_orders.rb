class AddDeliveryAddressToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :full_name, :string
    add_column :orders, :delivery_country, :string
    add_column :orders, :zip, :string
    add_column :orders, :address, :string
    add_column :orders, :phone, :string
    add_column :orders, :email, :string
  end
end
