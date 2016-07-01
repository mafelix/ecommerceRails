class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  # def index
  #   @cart_items = CartItem.all
  #   respond_with(@cart_items)
  # end

# find out if rails sorts on update column cuz this is annoying.

  def create
    # grabbing cart from application controller current_cart method
    @cart = current_cart
    # session[:cart_id] = @cart.id
    # individual product items get added to cart item and added to cart and saved
    @cart_item = @cart.cart_items.build(cart_item_params)
    @cart.save
  end

  def update
    @cart = current_cart
    # finding cart_items by cart_id
    @cart_item = @cart.cart_items.find(params[:id])
    # @cart_items.order(:id)
    @cart_item.update_attributes(cart_item_params)
    @cart_items = @cart.cart_items.order(:id)
    # redirect 'cart_show_path'
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    # @cart_cart_items = @cart.cart_items
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    def cart_item_params
      params.require(:cart_item).permit(:cart_id, :product_id, :unit_price, :quantity, :total_price)
    end
end
