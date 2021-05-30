class LedgerBalanceController < ApplicationController
  def index
    page = params[:page].to_i > 0 ? params[:page] : 1
    per_page = params[:per_page].to_i > 0 ? params[:per_page] : 10
    data = UserLegderBalance.paginate(page: page, per_page: per_page)
    render json: data.map(&:web_json)
  end

  def destroy
    UserLegderBalance.find(params[:id]).destroy
    render json: true
  end

  def show
    data = UserLegderBalance.find(params[:id])
    render json: data.web_json
  end
end
