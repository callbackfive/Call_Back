class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :category
      t.string :summary
      t.string :content
      t.integer :target_amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
