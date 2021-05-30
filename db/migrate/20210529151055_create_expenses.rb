class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.float :amount
      t.integer :paid_by
      t.integer :split_type_id
      t.timestamps
    end
  end
end
