class Cart < ActiveRecord::Base
  belongs_to :order
  has_many :cart_items

  # has_many :products, :through => :cart_items
  # has_and_belongs_to_many :products
  
end
