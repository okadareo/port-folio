class Admins::ResearchesController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @research = Research.where(status: false)
      @researches = Research.where(customer_id: params[:customer_id]).order(created_at: :desc).page(params[:page]).per(10)
    else
      @research = Research.where(status: false)
      @search_params = research_search_params
      if @search_params.present?
        logger.debug(@search_params)
        @researches = Research.research(@search_params).order(status: :asc).page(params[:page]).per(25)
      else
        @researches = Research.all.order(status: :asc).page(params[:page]).per(25)
      end
    end
  end

  def show
    @research = Research.find(params[:id])
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

  private

  def research_search_params
    params.fetch(:search, {}).permit(:name, :created_at_from, :created_at_to)
  end
end
