class ProductsController<ApplicationController

  def index
    if params[:search] == "" && params[:category] == "Select Category"
      @products = Product.all

    elsif params[:search] != ""
      params[:search] = params[:search].downcase
      @products = Product.searchName(params[:search])
    end
  end

  def show
    @product = Product.find(params[:id])
  end
  
end