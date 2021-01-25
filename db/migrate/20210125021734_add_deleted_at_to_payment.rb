class AddDeletedAtToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :deleted_at, :datetime
    add_index :payments, :deleted_at
  end
end
