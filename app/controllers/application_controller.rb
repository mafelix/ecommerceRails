class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def restricted_access
    if !current_user
      flash[:alert] = "You cannot access this without logging in"
    end
  end
end
