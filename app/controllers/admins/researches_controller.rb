class Admins::ResearchesController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @researches = Research.where(customer_id: params[:customer_id]).order(created_at: :desc).page(params[:page]).per(10)
    else
      @researches = Research.all.order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def show
  end

  def edit
  end

  def update
  end

end
