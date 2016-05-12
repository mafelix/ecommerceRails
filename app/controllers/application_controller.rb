class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :configure_permitted_params, if: :devise_controller?

  protected
  # def configure_permitted_params
  #   devise_parameters_sanitizer.for(:sign_up) {|u| u.permit(:username, :email, :password, :password_confirmation)}
  # end

  def restricted_access
    if !current_user
      flash[:alert] = "You cannot access this without logging in"
    end
  end

  # def current_user
  #   @current_user ||= User.find(session[:id]) if session[:id]
  # end


  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end

  end
end
