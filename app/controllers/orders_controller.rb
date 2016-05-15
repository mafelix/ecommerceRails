class OrderController<ApplicationController

  def create
    @order = current_order
  end
end
