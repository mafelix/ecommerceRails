class ProductsController<ApplicationController

  def index
    if params[:search] == "" || params[:search].nil?
      @products = Product.all

    # end
    elsif params[:search] != "" && params[:search] != nil
      params[:search] = params[:search].downcase
      @products = Product.searchName(params[:search])
    # elsif params[:category] == "Green"
    #   @products = Product.green
    # elsif params[:category] == "Accessories"
    #   @prodcuts = Product.Accessories
    # elsif params[:category] == "Herbal"
    #   @products = Product.herbal 
    end

  end

  def show
    @product = Product.find(params[:id])
  end
  
end