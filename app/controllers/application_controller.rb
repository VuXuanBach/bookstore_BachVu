class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_all_categories, :set_selected_category

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

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, format: 'js', alert: 'You need to sign in or sign up before continuing!'
    end
  end
end
