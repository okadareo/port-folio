class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!, only: [:index]

  def index
    @customers = Customer.all.page(params[:page]).per(20)
    @researches = Research.where(status: false)
  end

  def edit
    @customer = Customer.find(params[:id])
    @researches = Research.where(status: false)
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update
      redirect_to admins_customers_path
    else
      render "edit"
    end
  end

  def withdraw
    customer = Customer.find(params[:customer_id])
    if customer.update(customer_params) #updateでstatusをviewからきたストロングパラメータの内容に変更
      flash[:status] = "ステータスの変更が完了しました。"
      redirect_to admins_customers_path
    end
  end

  def customer_params
    params.require(:customer).permit(:status)
  end
end