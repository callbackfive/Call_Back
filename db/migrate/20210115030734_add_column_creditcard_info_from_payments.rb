class AddColumnCreditcardInfoFromPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :trade_no, :string
    add_column :payments, :card_4no, :string

  end
end
