class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :admin?, :restricted_access, :current_cart, :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def submit_cart
    @order = Order.new
  end

  def current_cart
    # if user is logged in
    @user = current_user
    # checking user to see if account is confirmed and verified
    if @user.confirmed_at != nil
      # && @user.verified == true <- maybe don't check for verified until checkout
      # checking if user already has cart in cart database
      if Cart.find_by(users_id: @user.id) != nil
        # find a row in the database where users_id: equal to @user.id
        # where clause does not work here
        cart = Cart.find_by(users_id: @user.id)
        session[:cart_id] = cart.id
        cart.save
        #establish Cart session cart for user
        Cart.find(session[:cart_id])
      else
        # create a new Cart Object for user.assign current_user's id to cart object
        cart = Cart.new
        cart.users_id = @user.id
        # save it to get cart id assign session[:cart_id] == cart.id
        cart.save
        session[:cart_id] = cart.id
      end
    end
  end

  #   @cart = Cart.find(session[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   @cart = Cart.new
  #   session[:cart_id] = @cart.id
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:province, :password, :username, :first_name, :last_name, :address, :postal_code, :image_one, :image_two])
    devise_parameter_sanitizer.permit(:account_update, keys:[:province, :address, :postal_code, :image_one, :image_two])
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
    if !current_user || current_user.admin != true
      flash[:alert] = "You do not have access to this."
      redirect_to page_index_path
    end
  end
          # original form for adding cart items to cart
          # <%= form_for @cart_item, remote: true do |f| %>
          # <div>
          #   <div class="input-group">
          #     <%= f.number_field :quantity, value: 1, class: "form-control", min: 1 %>
          #     <div class="input-group-btn">
          #       <%= f.hidden_field :product_id, value: product.id%>
          #       <%= f.submit "Add to Cart", class: "btn btn-primary"%>
          #     </div>
          #   </div>
          # </div>
          # <%end%>


end
