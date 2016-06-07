class CartController < ApplicationController

  def show
    @cart_items = current_order.cart_items
  end

  def subtotal
    cart_items.collect {|cart_items| cart_items.valid? ? (cart_items.quantity * cart_items.unit_price) : 0}.sum
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end

# cart_text item
# ( {number_to_currency current_order.subtotal} )"