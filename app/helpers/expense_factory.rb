class ExpenseFactory
  def self.get_expense(type:)
    if type == 'percent'
      PercentExpense
    elsif type == 'equal'
      EqualExpense
    elsif type == 'exact'
      ExactExpense
    end
  end
end
