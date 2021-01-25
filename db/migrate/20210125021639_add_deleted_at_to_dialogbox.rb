class AddDeletedAtToDialogbox < ActiveRecord::Migration[6.0]
  def change
    add_column :dialogboxes, :deleted_at, :datetime
    add_index :dialogboxes, :deleted_at
  end
end
