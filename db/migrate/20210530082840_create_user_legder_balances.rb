class CreateUserLegderBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :user_legder_balances do |t|
      t.integer :ower_id
      t.integer :owee_id
      t.string :amount

      t.timestamps
    end
  end
end
