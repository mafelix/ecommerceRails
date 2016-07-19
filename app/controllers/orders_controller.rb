class OrdersController<ApplicationController


  def new
    @order = Order.new(order_params)
  end

  def index

  end

  def create
    @order = Order.new(order_params)
  end

  def show
    @order = Order.find(params[:id])
  end



protected
  def order_params
    params.require(:order).permit(:category, :shipping_cost, :total_cost, :users_id, :invoice_num, :subtotal)
  end

end
