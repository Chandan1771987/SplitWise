class ExpensesController < ApplicationController
  include SplitWiseService
  def index
    page = params[:page].to_i > 0 ? params[:page] : 1
    per_page = params[:per_page].to_i > 0 ? params[:per_page] : 10
    data = Expense.search(params: params) || []
    render json: data.paginate(page: page, per_page: per_page).map(&:web_json)
  end

  def show
    render json: Expense.find(params[:id]).web_json
  end

  def create
    expense = SplitWiseManager.create_expense(params: params)
    render json: expense.web_json
  end

  def destroy
    Expense.find(params[:id]).destroy
    render json: true
  end
end
