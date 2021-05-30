class CreateBalanceSheetHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :balance_sheet_histories do |t|
      t.string :type
      t.integer :ower_id
      t.integer :owee_id
      t.integer :amount

      t.timestamps
    end
  end
end
