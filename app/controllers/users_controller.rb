class UsersController < ApplicationController
  def index
    page = params[:page].to_i > 0 ? params[:page] : 1
    per_page = params[:per_page].to_i > 0 ? params[:per_page] : 1
    data = User.paginate(page: page, per_page: per_page)
    render json: data.map(&:web_json)
  end

  def show
    user = User.find params[:id]
    render json: user.web_json
  end

  def create
  end

  def destroy
  end
end
