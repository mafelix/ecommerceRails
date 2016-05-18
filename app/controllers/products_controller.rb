class ProductsController<ApplicationController
before_filter :authenticate_user!


  def index
    @cart_item = current_order.cart_items.new
    if params[:search] == "" || params[:search].nil?
      @products = Product.all


    # end
    elsif params[:search] != "" && params[:search] != nil
      params[:search] = params[:search].downcase
      @products = Product.searchName(params[:search])
    end
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = current_order.cart_items.new
  end

end
