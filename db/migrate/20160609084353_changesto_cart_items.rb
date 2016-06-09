class ChangestoCartItems < ActiveRecord::Migration
  def change
  
    remove_reference :cart_items, :orders, index: true, foreign_key: true
    add_reference :cart_items, :users, index: true, foreign_key: true
  
  end
end
