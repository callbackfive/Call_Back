class AddDueDateToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :due_date, :datetime
  end
end
