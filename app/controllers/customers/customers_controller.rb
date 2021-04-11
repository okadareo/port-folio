class Customers::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
    @researches = current_customer.researches.all.order(created_at: :desc).page(params[:page]).per(10)
    estate = Estate.where(status: "有効")
    @favorites = current_customer.favorites.where(estate_id: estate.ids)
  end

  def withdraw
    customer = current_customer
    if customer.update(status: "無効") #updateでstatusをfalseに変更
      reset_session
      flash[:notice] = "退会処理が完了しました"
      redirect_to root_path
    end
  end

  #saveの場合
  # def withdraw
  #   customer = current_customer
  #   customer.status = "無効"
  #   if customer.save #saveでstatusをfalseに変更
  #     reset_session
  #     flash[:notice] = "退会処理が完了しました"
  #     redirect_to root_path
  #   end
  # end

  def unsubscribe
  end

end
