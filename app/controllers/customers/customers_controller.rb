class Customers::CustomersController < ApplicationController

  def show
    @customer = current_customer
    @favorites = current_customer.favorites.all
    @researches = current_customer.researches.all.page(params[:page]).per(10)
  end
end
