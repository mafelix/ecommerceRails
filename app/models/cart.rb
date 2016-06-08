class Cart < ActiveRecord::Base
  belongs_to :order

  # if a cart is destroyed the all the cart_items in it get destroyed as well
  has_many :cart_items, dependent: :destroy

  # has_many :products, :through => :cart_items
  # has_and_belongs_to_many :products
  
end
