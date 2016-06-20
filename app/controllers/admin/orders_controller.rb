class Admin::OrdersController<ApplicationController
before_filter :restricted_access

def index
  @orders = Order.all
end

def show
  @order = Order.find(params[:id])
end

def edit
  @order = Order.find(params[:id])
end

def update

end

private
  def admin_order_params
    Order.require(:order).permit(:status)
  end
end
