class DropProjectOwner < ActiveRecord::Migration[6.0]
  def change
    drop_table :project_owners
  end
end
