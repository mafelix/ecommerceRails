class ProductsController<ApplicationController
before_filter :authenticate_user!


  def index
    @cart_item = current_cart.cart_items.new 
    # params[:search] from the header :search_bar
    if params[:search] == "" || params[:search].nil?
      @products = Product.all
    elsif params[:search] != "" && params[:search] != nil
      params[:search] = params[:search].downcase
      @products = Product.searchName(params[:search])
    end
  end

  def show
    @product = Product.find(params[:id])
    
  end

end
