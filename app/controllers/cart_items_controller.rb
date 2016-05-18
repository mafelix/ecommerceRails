class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  # respond_to :html

  # def index
  #   @cart_items = CartItem.all
  #   respond_with(@cart_items)
  # end


  def create
    @order = current_order
    @order_item = @order.cart_items.new(cart_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_cart_item = @order.cart_items.find(params[:id])
    @order_cart_item.update_attributes(cart_item_params)
    @order_cart_items = @order.cart_items
  end

  def destroy
    @order = current_order
    @order_cart_item = @order.cart_items.find(params[:id])
    @order_cart_item.destroy
    @order_cart_items = @order.cart_items
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    def cart_item_params
      params.require(:cart_item).permit(:cart_id, :product_id, :order_id, :unit_price, :quantity, :total_price)
    end
end
