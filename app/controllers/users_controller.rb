class UsersController<ApplicationController

  def new
    @user = User.new
  end


  # def create

  #   @user = User.create(user_params)
  #   if @user.save
  #     session[:id] = @user.id
  #     redirect_to products_path, notice: "#{@user}, your account was successfully created"
  #   else
  #     render :new
  #   end

  # end






protected

# def user_params
#   params.require(:user).permit(:username, :first_name, :last_name, :email, :address, :postal_code, :password, :passwords_confirmation, {images: []})
# end


end
