class AddDeletedAtToGiveback < ActiveRecord::Migration[6.0]
  def change
    add_column :givebacks, :deleted_at, :datetime
    add_index :givebacks, :deleted_at
  end
end
