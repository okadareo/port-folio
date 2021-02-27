class Admins::ResearchesController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @researches = Research.where(status: false)
      @researches = Research.where(customer_id: params[:customer_id]).order(created_at: :desc).page(params[:page]).per(10)
    else
      @researches = Research.where(status: false)
      @researches = Research.all.order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def show
    @researches = Research.find(params[:id])
  end

  def support
    research = Research.find(params[:research_id])

    if research.status == "未対応"
      research.status = "対応済"
    elsif
      research.status == "対応済"
      research.status = "未対応"
    end

    if research.save
      flash[:status] = "対応状況が変更されました。"
      redirect_to admins_researches_path
    end
  end
end
