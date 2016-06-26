class CartsController < ApplicationController
  helper_method :subtotal

  def show
    @cart = Cart.find(session[:cart_id]);
    @cart_items = @cart.cart_items;
    @products = @cart_items.product;
    # @cart_items = current_cart.cart_items
  end

  def subtotal
    cart_items.collect {|cart_items| cart_items.valid? ? (cart_items.quantity * cart_items.unit_price) : 0}.sum
  end


  private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
