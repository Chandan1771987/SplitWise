class CreateSettlements < ActiveRecord::Migration[6.1]
  def change
    create_table :settlements do |t|
      t.integer :expense_id
      t.integer :payer_id
      t.integer :amount

      t.timestamps
    end
  end
end
