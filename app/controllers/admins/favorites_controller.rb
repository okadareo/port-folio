class Admins::FavoritesController < ApplicationController

  def index
    @customer = Customer.find(params[:customer_id])
    @favorites = Favorite.where(customer_id: params[:customer_id]).page(params[:page]).per(10)
  end
end
