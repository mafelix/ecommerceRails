class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :cart, index: true
      t.references :product, index: true
      t.references :order, index: true
      t.decimal :unit_price
      t.integer :quantity
      t.integer :total_price

      t.timestamps
    end
  end
end
