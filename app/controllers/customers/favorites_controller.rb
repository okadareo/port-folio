class Customers::FavoritesController < ApplicationController

  def create
    estate = Estate.find(params[:estate_id])
    favorite = current_customer.favorites.new(estate_id: estate.id)
    favorite.save
  end

  def destroy
    estate = Estate.find(params[:estate_id])
    favorite = current_customer.favorites.find_by(estate_id: estate.id)
    favorite.destroy
  end
end
