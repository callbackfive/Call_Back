class CreateGivebacks < ActiveRecord::Migration[6.0]
  def change
    create_table :givebacks do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.datetime :deliver_time
      t.integer :quantity
      t.string :belongs_to
      t.string :project

      t.timestamps
    end
  end
end
