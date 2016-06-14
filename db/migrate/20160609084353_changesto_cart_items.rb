class ChangestoCartItems < ActiveRecord::Migration
  def change
    # remove reference from cart_items belonging to orders
    remove_reference :carts, :order, index: true, foreign_key: true
    
    # add reference from cart_items belonging to users instead
    add_reference :carts, :users, index: true, foreign_key: true
  
  end
end
