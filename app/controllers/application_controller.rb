class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_product
  before_action :current_location, unless: :devise_controller?
  before_action :set_locale

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

  def current_location
    store_location_for(:customer, request.url)
  end

  def set_locale
    I18n.locale = locale
  end

  def locale
    @locale ||= params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    options.merge(locale: locale)
  end
end
