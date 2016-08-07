class Cart < ActiveRecord::Base
  # if a cart is destroyed the all the cart_items in it get destroyed as well
  has_many :cart_items, dependent: :destroy
  belongs_to :user
  # has_many :products, :through => :cart_items
  # has_and_belongs_to_many :products

  # method to empty current_cart when user submits to order
  def empty!
    self.cart_items.each do |item|
      item.cart_id = nil
      item.save!
    end
  end
end
