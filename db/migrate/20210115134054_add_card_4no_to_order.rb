class AddCard4noToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :card_4no, :string
  end
end
