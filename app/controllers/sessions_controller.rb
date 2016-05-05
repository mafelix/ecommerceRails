class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect_to products_path, notice: "Welcome back #{user.first_name}"
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end
end
