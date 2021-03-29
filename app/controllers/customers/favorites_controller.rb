class Customers::FavoritesController < ApplicationController

  def create
    @estate = Estate.find(params[:estate_id])
    @favorite = Favorite.new
    @favorite.estate_id = params[:estate_id]
    @favorite.customer_id = current_customer.id
    # @favorite = current_customer.favorites.new(estate_id: params[:estate_id])は5-7行目を1行でまとめたもの
    # @favorite = current_customer.favorites.new(estate_id: @estate.id)１行目の変数を代入でも可能
    @favorite.save
  end

  def destroy
    @estate = Estate.find(params[:estate_id])
    @favorite = current_customer.favorites.find_by(estate_id: @estate.id)
    # @favorite = Favorite.find_by(estate_id: params[:estate_id], customer_id: current_customer.id)
    # 16行目は15行目を細かく書いたもの。params[:estate_id]は14行目の変数を代入して(@estate.id)でも可能
    @favorite.destroy
  end
end
