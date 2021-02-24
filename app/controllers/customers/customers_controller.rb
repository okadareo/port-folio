class Customers::CustomersController < ApplicationController
  # before_action :authenticate_customer!
  # before_action :correct_customer, only: [:show]

  def show
    @customer = current_customer
    @favorites = current_customer.favorites.all
    @researches = current_customer.researches.all.order(created_at: :desc).page(params[:page]).per(5)
  end

  # private

  # def correct_customer
  #   if @customer.id != customer.id
  #     redirect_to root_path
  #   end
  # end
end
