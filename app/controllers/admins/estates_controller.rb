class Admins::EstatesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @estate = Estate.new
    @researches = Research.where(status: false)
  end

  def create
    @estate = Estate.new(estate_params)
    if @estate.save
      flash[:new] = "新規物件の入稿が完了しました"
      redirect_to admins_estates_path
    else
      render "new"
    end
  end

  def index
    @estates = Estate.all.order(created_at: :desc).page(params[:page]).per(10)
    @researches = Research.where(status: false)
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
    if @estate.update(estate_params)
      flash[:notice] = "入稿物件の編集が完了しました"
      redirect_to admins_estates_path
    else
      render "edit"
    end
  end

  def destroy
    estate = Estate.find(params[:id])
    if estate.destroy
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
end
