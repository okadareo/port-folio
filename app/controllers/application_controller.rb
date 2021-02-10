class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_product

  def after_sign_in_path_for(resource)
    case resource
    when Customer
      request.referer
    when Admin
      new_admins_estate_path
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
    @q = Estate.ransack(params[:q])
    @estates = @q.result
  end
end
