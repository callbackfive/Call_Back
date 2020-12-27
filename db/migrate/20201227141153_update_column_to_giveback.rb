class UpdateColumnToGiveback < ActiveRecord::Migration[6.0]
  def change
    add_reference(:givebacks, :project, index: true)
    remove_columns(:givebacks, :belongs_to, :project)
  end
end
