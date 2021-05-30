class SettlementController < ApplicationController
  def index
    page = params[:page].to_i > 0 ? params[:page] : 1
    per_page = params[:per_page].to_i > 0 ? params[:per_page] : 10
    data = Settlement.paginate(page: page, per_page: per_page)
    render json: data.map(&:web_json)
  end

  def create
    render json: SplitWiseManager.create_settlement(params: params)
  end

  def show
    data = Settlement.find(params[:id])
    render json: data.web_json
  end

  def destroy
    data = Settlement.find(params[:id])
    data.destroy
    render json: true
  end
end
