class EqualExpense < Expense

  def self.create_and_split_expenses(params:)
    params = params[:body]
    type = params[:type]
    amount = params[:amount]
    paid_by = params[:paid_by]
    split_type = SplitFactory.get_split(type: type)
    st = split_type.first
    user = User.find paid_by
    splits = params[:splits]
    _expense = create!(paid_by: user.id, split_type_id: st.id, amount: amount)
    each_share = amount/splits.size
    splits.each do |split|
      if split[:user_id].to_i == paid_by.to_i
        split[:amount] = each_share + (amount - each_share * splits.size)
      else
        split[:amount] = each_share
      end
    end
    splits.each do |split|
      _expense.user_expense_splits.create(user_id: split[:user_id], amount: split[:amount])
    end
    _expense
  end

  def self.validate(splits:, amount: nil)
    true
  end
end