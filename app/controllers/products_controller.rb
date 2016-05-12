class ProductsController<ApplicationController
before_filter :authenticate_user!


  def index
    if params[:search] == "" || params[:search].nil?
      @products = Product.all

    # end
    elsif params[:search] != "" && params[:search] != nil
      params[:search] = params[:search].downcase
      @products = Product.searchName(params[:search])
    end

    # respond_to do |format| 
      # need to implement respond_to format after jeremycodejam!
      # format.js {}

    # end

  end

  def show
    @product = Product.find(params[:id])
  end
  
end