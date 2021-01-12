class AddRefToCategory < ActiveRecord::Migration[6.0]
  def change
    add_reference(:projects, :category, foreign_key: true)
  end
end
