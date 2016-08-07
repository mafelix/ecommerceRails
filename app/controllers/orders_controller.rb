class OrdersController<ApplicationController
# before_action :cart_not_empty?
  # orders are finalized in new order.
  def new
    @order_status = OrderStatus.create!()
    @order = Order.create!(users_id: current_cart.users_id)
    @user = User.find(@order.users_id)

    @order.shipping_cost = 15
    @order.invoice_num = @order.id

    current_cart.cart_items.each do |item|
      item.order_id = @order.id
      item.save!
    end
    
    if @order.save
      current_cart.empty!
      # current_cart.cart_items.each do |item|
      #   item.cart_id = nil
      #   item.save!
      # end
      OrderMailer.invoice_email(@user, @order)
    else
      redirect cart_show_path(@user.id)
    end
  end

  def index

  end



protected




  def order_params
    params.require(:order).permit(:category, :shipping_cost, :total_cost, :users_id, :invoice_num, :subtotal)
  end

end
