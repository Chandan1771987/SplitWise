class Expense < ApplicationRecord
  has_many :user_expense_splits
  belongs_to :split_type

  belongs_to :user, :foreign_key => 'paid_by'

  def web_json
    json = super
    json[:splits] = self.user_expense_splits.map(&:web_json).each{|c| c[:split_type] = split_type.type}
    json
  end

  def self.search(params:)
    data = Expense
    data.where(paid_by: params[:paid_by]) if params[:paid_by].present?
    data
  end

  def self.create_and_split_expenses(params:)
    params = params[:body]
    type = params[:type]
    amount = params[:amount]
    paid_by = params[:paid_by]
    split_type = SplitFactory.get_split(type: type)
    st = split_type.first
    user = User.find paid_by
    splits = params[:splits]
    raise Exception.new('invalid splits') unless validate(splits: splits, amount: amount)
    _expense = create!(paid_by: user.id, split_type_id: st.id, amount: amount)
    splits.each do |split|
      _expense.user_expense_splits.create(user_id: split[:user_id], amount: split[:amount])
    end
    _expense
  end

  def self.validate(splits:, amount: nil)
    splits.map{|c| c[:amount] }.sum == amount
  end
end

