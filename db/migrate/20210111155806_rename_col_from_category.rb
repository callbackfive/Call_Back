class RenameColFromCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :categories, :category_title, :title
  end
end
