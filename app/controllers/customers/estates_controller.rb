class Customers::EstatesController < ApplicationController

  def top
    @q = Estate.order(created_at: :desc).limit(6).ransack(params[:q])
    @estates = @q.result(distinct: true)
  end
  def index
    if !params.has_key?(:q)
      @estates = Estate.all.order(created_at: :desc).page(params[:page]).per(12)
    else
      if params[:q][:address_start].empty? && params[:q][:floor_eq].empty? && params[:q][:price_gteq].empty? && params[:q][:price_lteq].empty? && !params[:q].has_key?(:groupings)
         flash[:notice] = "検索条件を入力してください"
         render "top"
      end
      if @q = Estate.all.order(created_at: :desc).page(params[:page]).per(12).ransack(params[:q])
         @estates = @q.result(distinct: true)
         @message = "検索条件に合致した物件はございません。再度、検索条件を変更して検索してみて下さい。"
      end
    end
  end

  def show
    @estate = Estate.find(params[:id])
  end

  def finish
  end
end
