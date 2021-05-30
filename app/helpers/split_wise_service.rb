module SplitWiseService
  def self.create_expense(params: params)
    expense = ExpenseFactory.get_expense(type: params[:body][:type])
    expense.create_and_split_expenses(params: params)
  end
end
