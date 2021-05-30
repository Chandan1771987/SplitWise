class CreateUserExpenseSplits < ActiveRecord::Migration[6.1]
  def change
    create_table :user_expense_splits do |t|
      t.integer :user_id
      t.integer :expense_id
      t.integer :amount
      t.timestamps
    end
  end
end
