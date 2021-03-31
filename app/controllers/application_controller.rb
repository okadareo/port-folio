class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_product
  before_action :current_location, unless: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Customer
      stored_location_for(resource) || root_path
    when Admin
      admins_estates_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :customer
      root_path
    when :admin
      new_admin_session_path
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
  end

  def search_product
    @keywords = params[:q].delete(:keyword) if params[:q].present?
    #params[:q].delete(:keyword)でparams[:q]の中身から:keywordを分離させて(:keyword)を＠keywordsに代入させる
    if @keywords.present?
      params[:q][:groupings] = []
      #params[:q]に新しいハッシュをgroupingsというkeyで作っている
      @keywords.split(/[ 　]/).each_with_index do |keyword, i|
      #.splitで[]の中身の半角、全角で区切られたワードを配列にしている
      #each_with_indexで0から番号をつけ、keywordには検索ワードが１つずつ入ってきて、iには0から数字がつく
      params[:q][:groupings][i] = { name_or_info_or_address_or_floor_cont: keyword }
      #params[:q]には新しく作ったgroupingsのハッシュに配列でkeywordの数だけ入ってくる
      end
    end
    @q = Estate.ransack(params[:q])
    @estates = @q.result
  end

  def current_location
    store_location_for(:customer, request.url)
  end
end
