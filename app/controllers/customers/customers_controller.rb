class Customers::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
    @favorites = current_customer.favorites.all
    @researches = current_customer.researches.all.order(created_at: :desc).page(params[:page]).per(5)
  end

  def withdraw
    customer = current_customer
    if customer.update(status: "無効") #updateでstatusをfalseに変更
      reset_session
      flash[:notice] = "退会処理が完了されました。"
      redirect_to root_path
    end
  end
  
  #saveの場合
  # def withdraw
  #   customer = current_customer
  #   customer.status = "無効"
  #   if customer.save #updateでstatusをfalseに変更
  #     reset_session
  #     flash[:notice] = "退会処理が完了されました。"
  #     redirect_to root_path
  #   end
  # end

  def unsubscribe
  end

  private

  def customer_params
    params.permit(:status)
  end
end
