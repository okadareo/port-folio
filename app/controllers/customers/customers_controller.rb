class Customers::CustomersController < ApplicationController

  def show
    @customer = current_customer
    @favorites = current_customer.favorites.all
    @researches = current_customer.researches.all.order(created_at: :desc).page(params[:page]).per(5)
  end
end
