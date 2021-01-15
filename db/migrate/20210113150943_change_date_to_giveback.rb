class ChangeDateToGiveback < ActiveRecord::Migration[6.0]
  def change
    change_column :givebacks, :deliver_time, :date
  end
end
