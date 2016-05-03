class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :category
      t.integer :shipping_cost
      t.decimal :total_cost
      
      t.timestamps
    end
  
      add_reference(:orders, :users, index: :true)


  end
end