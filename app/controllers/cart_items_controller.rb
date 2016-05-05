class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cart_items = CartItem.all
    respond_with(@cart_items)
  end

  def show
    respond_with(@cart_item)
  end

  def new
    @cart_item = CartItem.new
    respond_with(@cart_item)
  end

  def edit
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    respond_with(@cart_item)
  end

  def update
    @cart_item.update(cart_item_params)
    respond_with(@cart_item)
  end

  def destroy
    @cart_item.destroy
    respond_with(@cart_item)
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    def cart_item_params
      params.require(:cart_item).permit(:cart_id, :product_id, :order_id, :unit_price, :quantity, :total_price)
    end
end
