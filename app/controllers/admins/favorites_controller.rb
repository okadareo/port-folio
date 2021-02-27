class Admins::FavoritesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customer = Customer.find(params[:customer_id])
    @favorites = Favorite.where(customer_id: params[:customer_id]).order(created_at: :desc).page(params[:page]).per(10)
    @researches = Research.where(status: false)
  end
end
