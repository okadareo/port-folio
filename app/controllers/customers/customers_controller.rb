class Customers::CustomersController < ApplicationController

  def show
    @customer = current_customer
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:estate_id)
    @favorite = Estate.find(favorites)
  end
end
