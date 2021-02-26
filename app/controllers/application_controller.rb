class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_product

  def after_sign_in_path_for(resource)
    case resource
    when Customer
      root_path
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

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
  end

  def search_product
    keywords = params[:q].delete(:keyword) if params[:q].present?
    if keywords.present?
      params[:q][:groupings] = []
      keywords.split(/[ 　]/).each_with_index do |keyword, i|
        params[:q][:groupings][i] = { name_or_info_or_address_or_floor_cont: keyword }
      end
    end
      @q = Estate.ransack(params[:q])
      @estates = @q.result
      @keywords = keywords
  end
end
