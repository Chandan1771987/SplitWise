class PercentExpense < Expense
  def self.create_and_split_expenses(params:)
    params = params[:body]
    type = params[:type]
    paid_by = params[:paid_by]
    split_type = SplitFactory.get_split(type: type)
    st = split_type.first
    user = User.find paid_by
    amount = params[:amount]
    splits = params[:splits]
    raise Exception.new('invalid percentages') unless validate(splits: splits)
    _expense = create!(paid_by: user.id, split_type_id: st.id, amount: amount)
    splits.each do |split|
      split[:amount] =  (split[:amount] * amount)/100
      _expense.user_expense_splits.create(user_id: split[:user_id], amount: split[:amount])
    end
    _expense
  end

  def self.validate(splits:, amount: nil)
    splits.map{|c| c[:amount] }.sum == 100
  end
end