class CreateProjectOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :project_owners do |t|
      t.belongs_to  :user
      t.text        :description
      t.string      :image
      t.timestamps
    end
  end
end
