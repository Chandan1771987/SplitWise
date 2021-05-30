class SplitWiseManager
  def self.create_expense(params:)
    expense = SplitWiseService.create_expense(params: params)
    update_balance_sheet(expense)
    update_ledger_for_expense(expense)
    expense
  end

  def self.create_settlement(params:)
    settlement = Settlement.create!(expense_id: params[:expense_id], amount: params[:amount], payer_id: params[:paid_by])
    self.update_ledger_for_settlement(settlement)
    settlement
  end

  def self.update_ledger_for_expense(expense)
    paid_by = expense.paid_by
    splits = expense.user_expense_splits
    splits.each do |split|
      next if split.amount.zero? || expense.paid_by == split.user.id
      sum = BalanceSheetHistory.where(ower_id: split.user.id, owee_id: paid_by).sum(:amount)
      ulb = UserLegderBalance.where(ower_id: split.user.id, owee_id: paid_by).first_or_create
      ulb.update_column(:amount, sum)
    end
  end

  def self.update_ledger_for_settlement(settlement)
    amount = settlement.amount
    owee_id = settlement.expense.paid_by
    ower_id = settlement.paid_by
    ulb = UserLegderBalance.where(ower_id: ower_id, owee_id: owee_id).first_or_create
    ulb.update_column(:amount, ulb.amount - amount)
  end

  def self.update_balance_sheet(expense)
    paid_by = expense.paid_by
    splits = expense.user_expense_splits
    splits.each do |split|
      next if split.amount.zero? || expense.paid_by == split.user.id
      BalanceSheetHistory.create!(ower_id: split.user.id, owee_id: paid_by, amount: split.amount)
    end
  end

  def self.display_user_balance_sheet(paid_by)
    balances = balance_sheet.get(paid_by)
    balances.each do |k,v|
      next if v.zero?
      print_balances(paid_by, k, v)
    end
  end
end