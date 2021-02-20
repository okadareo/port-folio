class Customers::FavoritesController < ApplicationController

  def create
    @estate = Estate.find(params[:estate_id])
    @favorite = Favorite.new
    @favorite.estate_id = params[:estate_id]
    @favorite.customer_id = current_customer.id
    # favorite = current_customer.favorites.new(estate_id: estate.id)
    @favorite.save
  end

  def destroy
    @estate = Estate.find(params[:estate_id])
    @favorite = current_customer.favorites.find_by(estate_id: @estate.id)
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to customers_path }
      format.js
    end
  end
end
