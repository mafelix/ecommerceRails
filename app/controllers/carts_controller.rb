class CartsController < ApplicationController
  helper_method :subtotal

  def show
    # application controller method to find shopping cart
    @cart = current_cart
    @cart_items = @cart.cart_items.order(:id);
    @products = @cart_items.product;
  end

  def subtotal
    cart_items.collect {|cart_items| cart_items.valid? ? (cart_items.quantity * cart_items.unit_price) : 0}.sum
  end


  private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
