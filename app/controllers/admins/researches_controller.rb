class Admins::ResearchesController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @research = Research.where(status: false)
      @researches = Research.where(customer_id: params[:customer_id]).order(created_at: :desc).page(params[:page]).per(10)
    else


        @research = Research.where(status: false)
        name = research_search_params[:name]
        create = research_search_params[:created_at_from]
        @researches = Research.search(name, create).order(status: :asc).page(params[:page]).per(10)
        logger.debug(@researches)
      # @search_params = _search_params
      # @users = User.search(@search_params).includes(:prefecture)
    end
  end

  # def search
  #   word = params[:search_word]
  #   @researches = Research.search(word)
  #   redirect_to admins_researches_path
  # end

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
