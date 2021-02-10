class Customers::EstatesController < ApplicationController

  def top
    # @estates = Estate.order(created_at: :desc).limit(6)
    @q = Estate.ransack(params[:q])
    @estates = @q.result
  end
  def index
    # @estates = Estate.all.page(params[:page]).per(12)
    @q = Estate.ransack(params[:q])
    @estates = @q.result
  end

  def show
    @estate = Estate.find(params[:id])
  end

  def finish
  end
end
