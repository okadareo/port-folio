class Admins::EstatesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @estate = Estate.new
    @researches = Research.where(status: false)
  end

  def create
    @estate = Estate.new(estate_params)
    @researches = Research.where(status: false)
    if @estate.save
      flash[:new] = "新規物件の入稿が完了しました"
      redirect_to admins_estates_path
    else
      render "new"
    end
  end

  def index
    @researches = Research.where(status: false)
    @search_params = research_search_params
    if @search_params.empty?
      @estates = Estate.where(status: "有効").order(created_at: :desc).page(params[:page]).per(10)
    else
      if @search_params[:name].empty? && @search_params[:address].empty? && @search_params[:floor].empty? && @search_params[:price_from].empty? && @search_params[:price_to].empty?
        flash[:notice] = "検索条件を入力してください"
        redirect_to admins_estates_path
      end
      if
        @estates = Estate.where(status: "有効").research(@search_params).order(created_at: :desc).page(params[:page]).per(10)
      end
    end
  end

  def show
    @estates = Estate.find(params[:id])
    @research = Research.where(status: false)
    @researches = Research.where(estate_id: params[:id]).order(created_at: :desc).page(params[:page]).per(10)
  end

  def edit
    @estate = Estate.find(params[:id])
    @researches = Research.where(status: false)
  end

  def update
    @estate = Estate.find(params[:id])
    @researches = Research.where(status: false)
    if @estate.update(estate_params)
      flash[:edit] = "入稿物件の編集が完了しました"
      redirect_to admins_estates_path
    else
      render "edit"
    end
  end

  def destroy
    @estate = Estate.find(params[:estate_id])
    if @estate.update(status: "無効")
      flash[:destroy] = "入稿物件の削除が完了しました"
      redirect_to admins_estates_path
    end
  end

  private

  def estate_params
    params.require(:estate).permit(
      :background_image,
      :floor_image,
      :property_image_a,
      :property_image_b,
      :property_image_c,
      :property_image_d,
      :property_image_e,
      :property_image_f,
      :property_image_g,
      :property_image_h,
      :property_image_i,
      :property_image_j,
      :property_image_k,
      :property_image_l,
      :name, :room_number, :info, :address, :floor, :price)
  end

  def research_search_params
    params.fetch(:search, {}).permit(:name, :address, :floor, :price_from, :price_to)
  end
end
