class Admins::EstatesController < ApplicationController
  def new
    @estate = Estate.new
  end

  def create
    @estate = Estate.new(estate_params)
    if @estate.save!
      redirect_to admins_estates_path
    end
  end

  def index
    @estates = Estate.all.page(params[:page]).per(10)
    #@estates = Estate.all.includes(:researches) この書き方でも可能
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def edit
    @estate = Estate.find(params[:id])
  end

  def update
    @estate = Estate.find(params[:id])
    @estate.update(estate_params)
    redirect_to admins_estates_path
  end

  def destroy
    estate = Estate.find(params[:id])
    estate.destroy
    redirect_to request.referer
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
      :property_image_m,
      :property_image_n,
      :property_image_o,
      :name, :room_number, :info, :address, :floor, :price)
  end
end
