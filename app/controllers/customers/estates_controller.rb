class Customers::EstatesController < ApplicationController

  def top
    @estates = Estate.all.order(created_at: :desc).limit(6)
  end
  def index
    @estates = Estate.all.page(params[:page]).per(12)
  end

  def show
    @estate = Estate.find(params[:id])
  end

  def finish
  end

end
