class Foreignkeyfix < ActiveRecord::Migration
  def change
    remove_reference :cart_items, :order, index: true, foreign_key: true
    remove_reference :products, :orders, index:true, foreign_key: true

    remove_reference :carts, :user, index:true, foreign_key: true
    add_reference :carts, :order, index: true, index: true
  end
end
