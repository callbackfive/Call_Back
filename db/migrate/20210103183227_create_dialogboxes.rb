class CreateDialogboxes < ActiveRecord::Migration[6.0]
  def change
    create_table :dialogboxes do |t|
      t.belongs_to :project, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
