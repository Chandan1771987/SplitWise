class User < ApplicationRecord
  has_many :user_expense_splits

  has_many :expenses

  def expense_splits(expense_ids: )
    user_expense_splits.where(expense_id: expense_ids)
  end

end
