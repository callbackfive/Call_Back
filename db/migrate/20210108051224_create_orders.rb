class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to  :user
      t.belongs_to  :giveback
      t.string      :project_title
      t.datetime    :issue_date
      t.integer     :status, default: 0, null: false
      t.string      :giveback_title
      t.integer     :giveback_price
      t.integer     :quantity
      t.string      :merchant_order_no
      t.timestamps
    end
  end
end
