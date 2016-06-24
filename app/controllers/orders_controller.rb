class OrdersController<ApplicationController

  def create
    @order = Order.new(order_params)
  end
  #
  #
  #
  # protected
  #
  def order_params
    params.require(:order).permit(:category, :shipping_cost, :total_cost, :users_id, :invoice_num, :subtotal)
  end

end
