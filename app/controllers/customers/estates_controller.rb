class Customers::EstatesController < ApplicationController

  def top
    @q = Estate.order(created_at: :desc).limit(6).ransack(params[:q])
    @estates = @q.result(distinct: true)
  end
  def index
    @q = Estate.order(created_at: :desc).page(params[:page]).per(12).ransack(params[:q])
    @estates = @q.result(distinct: true)
  end

  def show
    @estate = Estate.find(params[:id])
  end

  def finish
  end

end
