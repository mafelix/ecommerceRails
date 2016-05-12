class Admin::ProductsController < ApplicationController
      
  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.create(admin_product_params)

    if @product
      flash[:alert] = "<%=@product.name%> successfully created."
      redirect_to admin_products_path
    else
      flash[:alert] = "Product was not successfully created."
      redirect_to new_admin_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(admin_product_params)
      flash[:alert] = "<%=@product.name%> successfully saved."
      redirect_to admin_products_path
    # else
    #   render 
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    # destroy product for admin namespace only.
    redirect_to admin_products_path
  end

  protected

  def admin_product_params
    params.require(:product).permit(:category, :name, :description, :price, :picture, :featured)
  end

end
