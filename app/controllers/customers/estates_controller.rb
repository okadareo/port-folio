class Customers::EstatesController < ApplicationController

  layout "index", only: [:top]

  def top
    @q = Estate.where(status: "有効").order(created_at: :desc).limit(6).ransack(params[:q])
    @estates = @q.result(distinct: true)
    estate = Estate.where(status: "有効")
    @all_ranks = Estate.find(Favorite.group(:estate_id).where(estate_id: estate.ids).order("count(estate_id) desc").limit(6).pluck(:estate_id))

    # Favorite.group(:estate_id)　#物件の番号(estate_id)が同じものにグループを分ける
    # where(estate_id: estate.ids)　#estateに代入された変数でstatusが"有効"のみを表示
    # order("count(estate_id) desc").limit(6)　#それを、番号の多い順に並び替えて最多の６件を表示
    # pluck(:estate_id)　#最後に:estate_idカラムのみを数字で取り出すように指定
    # Estate.find()　#最終的に、pluckで取り出される数字を物件のIDとすることでいいね順に物件を取得する事ができる
  end

  def index
    if !params.has_key?(:q)
      @estates = Estate.where(status: "有効").order(created_at: :desc).page(params[:page]).per(12)
    else
      if params[:q][:address_start].empty? && params[:q][:floor_eq].empty? && params[:q][:price_gteq].empty? && params[:q][:price_lteq].empty? && !params[:q].has_key?(:groupings)
        flash[:notice] = "検索条件を入力してください"
        redirect_to root_path
      end
      if @q = Estate.where(status: "有効").order(created_at: :desc).page(params[:page]).per(12).ransack(params[:q])
        @estates = @q.result(distinct: true)
        @message = "検索条件に合致した物件はございません。再度、検索条件を変更して検索してみて下さい。"
      end
    end
  end

  def show
    @research = Research.new
    @estate = Estate.find(params[:id])
  end

  def new
    @research = Research.new
    @estate = Estate.find(params[:estate_id])
  end

  def create
    @estate = Estate.find(params[:estate_id])
    @research = Research.new(research_params)
    @research.estate_id = @estate.id
    @research.customer_id = current_customer.id
    if @research.save
      redirect_to estates_finish_path
    end
  end

  def finish
  end

  private

  def research_params
    params.require(:research).permit(:title, :body)
  end
end
