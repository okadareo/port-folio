class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!, only: [:index]

  def index
    @researches = Research.where(status: false)
    @search_params = research_search_params
    if @search_params.empty?
      @customers = Customer.all.page(params[:page]).per(20)
    else
      if @search_params[:name].empty? && @search_params[:phone_number].empty?
        flash[:status] = "検索条件を入力してください"
        redirect_to admins_customers_path
      end
      if
        @customers = Customer.research(@search_params).page(params[:page]).per(20)
      end
    end
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
      flash[:status] = "ステータスの変更が完了しました"
      redirect_to admins_customers_path
    end
  end

  def customer_params
    params.require(:customer).permit(:status)
  end
  
  private
  
  def research_search_params
    params.fetch(:search, {}).permit(:name, :phone_number)
  end
end