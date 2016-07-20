class AddCifkeytoOrders < ActiveRecord::Migration
  def change
    add_reference :cart_items, :order, foreign_key: true
  end
end
