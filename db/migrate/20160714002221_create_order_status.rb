class CreateOrderStatus < ActiveRecord::Migration
  def change
    create_table :order_statuses do |t|
      t.string :status
    end
    add_reference :orders, :order_status, index: true, foreign_key: true
  end
end
