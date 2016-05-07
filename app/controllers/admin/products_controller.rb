class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.create()
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(admin_product_params)
      flash[:alert] = "Product successfully saved."
    # else
    #   render 
    end
  end

  def destroy
    @product = Product.find(params[:id])
    
  end
end
