class ReviseCategoryColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :categories, :title, :category_title
  end
end
