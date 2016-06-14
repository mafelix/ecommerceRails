class ProductsController<ApplicationController
before_filter :authenticate_user!


  def index
    # current_cart's cart_items.new
    @cart_item = current_cart.cart_items.new
    # params[:search] from the header :search_bar

    # if the search is enter with nil then it should return all products
    if params[:search] == "" || params[:search].nil?
      @products = Product.all

    # else downcase the search value and pass the params to products model to search for products
    else
      params[:search] = params[:search].downcase
      @products = Product.searchName(params[:search])
    end
  end

  def show
    @cart_item = current_cart.cart_items.new
    @product = Product.find(params[:id])
  end

end
