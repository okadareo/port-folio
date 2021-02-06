class Admins::EstatesController < ApplicationController
  def new
    @estate = Estate.new
  end

  def create
    @estate = Estate.new(estate_params)
    if @estate.save
      redirect_to admins_estates_path
    end
  end

  def index
    @estates = Estate.all
    @customers = Customer.all
  end

  private

  def estate_params
    params.require(:estate).permit(:background_image, :floor_image, :property_image, :name, :info, :address, :floor, :price)
  end
end
