class PageController < ApplicationController
before_action :current_cart
  def index
    @products = Product.all
  end

end
