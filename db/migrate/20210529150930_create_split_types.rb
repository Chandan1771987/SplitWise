class CreateSplitTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :split_types do |t|
      t.integer :type
      t.string :name
      t.timestamps
    end
  end
end
