class CreateOrderStatus < ActiveRecord::Migration
  def change
    create_table :order_statuses do |t|
      t.integer :status
    end
    add_reference :order_statuses, :orders, index: true, foreign_key: true
  end
end
