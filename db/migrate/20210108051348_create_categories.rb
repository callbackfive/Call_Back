class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string  :title
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
