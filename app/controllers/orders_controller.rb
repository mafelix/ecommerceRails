class OrdersController<ApplicationController
before_action :cart_empty?
  # orders are finalized in new order.
  def new
    @order = Order.create!(users_id: current_cart.users_id)
    @user = User.find(@order.users_id)

    @order.shipping_cost = 15
    @order.invoice_num = @order.id

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
      OrderMailer.invoice_email(@user, @order)
    else
      redirect cart_show_path(@user.id)
    end
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
