class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_all_categories, :set_selected_category
  before_action :store_current_location, unless: :devise_controller?

  rescue_from CanCan::AccessDenied, ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error_render_method

  def error_render_method
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
      format.any  { head :not_found }
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :full_name
    devise_parameter_sanitizer.for(:account_update) << :full_name
  end

  def load_all_categories
    @categories = Category.all
  end

  def set_selected_category
    @selected_category = CategoryService.new(params, session).set_selected_category
  end

  private

  def store_current_location
    if request.format == "text/html" || request.content_type == "text/html"
      store_location_for(:user, request.url)
    end
  end

  private

  def store_current_location
    if request.format == "text/html" || request.content_type == "text/html"
      store_location_for(:user, request.url)
    end
  end
end
