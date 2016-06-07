class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order, :admin?, :current_user
  # before_action :current_order
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:username, :first_name, :last_name, :address, :postal_code, :image_one, :image_two])
    devise_parameter_sanitizer.permit(:account_update, keys:[:address, :postal_code, :image_one, :image_two])
  end

  def current_order
    if !session[:cart_id].nil?
      Cart.find(session[:cart_id])
    else
      Cart.new
    end
  end

  def restricted_access
    if !current_user
      flash[:alert] = "You cannot access this without logging in"
    end
  end


  def admin?
    current_user.admin == true
  end

  def restricted_access
    if !admin?
      flash[:alert] = "You do not have access to this."
      redirect_to page_index_path
    end
  end


end
