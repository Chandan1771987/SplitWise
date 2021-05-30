class BalanceSheetHistoryController < ApplicationController
  def index
    page = params[:page].to_i > 0 ? params[:page] : 1
    per_page = params[:per_page].to_i > 0 ? params[:per_page] : 10
    data = BalanceSheetHistory.search(params: params)
    render json: data.paginate(page: page, per_page: per_page).map(&:web_json)
  end

  def destroy
    BalanceSheetHistory.find(params[:id]).destroy
    render json: true
  end

  def show
    data = BalanceSheetHistory.find(params[:id])
    render json: data.web_json
  end
end
