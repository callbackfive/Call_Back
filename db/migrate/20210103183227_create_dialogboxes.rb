class CreateDialogboxes < ActiveRecord::Migration[6.0]
  def change
    create_table :dialogboxes do |t|
      t.references :project, null: false, foreign_key: true
      t.bigint :project_owner_id, null: false, foreign_key: true
      t.bigint :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
