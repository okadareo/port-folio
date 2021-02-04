class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      estates_path
    when Admin
    end
  end
  
  def after_sign_out_path_for(resource)
    case resource
    when :customer
      root_path
    when :admin
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
  end
end
