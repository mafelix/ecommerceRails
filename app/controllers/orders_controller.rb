class OrdersController<ApplicationController
before_action :cart_empty?
  # orders are finalized in new order.
  def new
    @order = Order.create!(users_id: current_cart.users_id)
    @user = User.find(@order.users_id)
    @order.shipping_cost = 15

    current_cart.cart_items.each do |item|
      item.order_id = @order.id
      item.save!
    end

    if @order.save
      current_cart.cart_items.each do |item|
        item.cart_id = nil
        item.save!
      end
      # destroying the cart and initializing a new cart for the user through application_controller method. could be optional.
      # current_cart.destroy
      # current_cart
    else
      redirect cart_show_path(@user.id)
    end
    # if @order.save
    #   current_cart.cart_items.each do |item|
    #     item.cart_id = nil
    #     item.save!
    #   end
    # else
    #
    # end

    # current_cart.cart_items.each do |item|
    #   item.cart_id = nil
    #   item.save
    # end

    # @order = Order.create(:cart_items => current_cart.cart_items);
    # current_cart.cart_items.each do |item|
    #   item.cart_id = nil
    # end
    # current_cart.save



    # @order = Order.new
    # @order.users_id = current_cart.users_id
    # @user = User.find(@order.users_id);
    # @order.shipping_cost = 15
    # # order takes copys of current_cart's cart_items/products
    # @order.cart_items = current_cart.cart_items
    # @order.save
    # #monkey wrench to clear current cart
    # current_cart.cart_items = []
  end

  def index

  end

  def create
    @order = Order.new(order_params)
  end

  def show
    @order = Order.find(params[:id])
  end

  def cart_empty?
    @order = current_cart
    if @order.cart_items.size == 0
      return true
    else
      return false
    end
  end

protected
  def order_params
    params.require(:order).permit(:category, :shipping_cost, :total_cost, :users_id, :invoice_num, :subtotal)
  end

end
