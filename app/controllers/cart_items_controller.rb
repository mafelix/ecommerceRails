class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  # respond_to :html

  # def index
  #   @cart_items = CartItem.all
  #   respond_with(@cart_items)
  # end


  def create
    @cart = current_order
    @cart_item = @cart.cart_items.new(cart_item_params)
    @cart.save
    session[:cart_id] = @cart.id
  end

  def update
    @cart = current_order
    @cart_cart_item = @cart.cart_items.find(params[:id])
    @cart_cart_item.update_attributes(cart_item_params)
    @cart_cart_items = @cart.cart_items
  end

  def destroy
    @cart = current_order
    @cart_cart_item = @cart.cart_items.find(params[:id])
    @cart_cart_item.destroy
    @cart_cart_items = @cart.cart_items
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    def cart_item_params
      params.require(:cart_item).permit(:cart_id, :product_id, :order_id, :unit_price, :quantity, :total_price)
    end

end
