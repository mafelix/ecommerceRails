class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :picture
      t.string :description
      t.decimal :price
      t.integer :quantity
      t.belongs_to :orders, index: true
      
      t.timestamps
    end
  end
end