class Admins::ResearchesController < ApplicationController
  # before_action :authenticate_admin!

  def index
    @customer = Customer.find(params[:customer_id])
    @researches = Research.where(customer_id: params[:customer_id]).order(created_at: :desc).page(params[:page]).per(10)
  end
end
