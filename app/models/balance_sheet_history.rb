class BalanceSheetHistory < ApplicationRecord

  belongs_to :ower, class_name: 'User', foreign_key: 'ower_id'
  belongs_to :owee, class_name: 'User', foreign_key: 'owee_id'

  def self.search(params:)
    data = BalanceSheetHistory.where("amount > 0")
    data = data.where(ower_id: params[:ower_id]) if params[:ower_id].present?
    data = data.where(owee_id: params[:owee_id]) if params[:owee_id].present?
    data
  end
end
