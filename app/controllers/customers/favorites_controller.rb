class Customers::FavoritesController < ApplicationController

  def create
    estate = Estate.find(params[:estate_id])
    favorite = current_customer.favorites.new(estate_id: estate.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    estate = Estate.find(params[:estate_id])
    favorite = current_customer.favorites.find_by(estate_id: estate.id)
    favorite.destroy
    redirect_to request.referer
  end
end
