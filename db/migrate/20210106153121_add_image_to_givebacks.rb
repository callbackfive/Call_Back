class AddImageToGivebacks < ActiveRecord::Migration[6.0]
  def change
    add_column :givebacks, :image, :string
  end
end
