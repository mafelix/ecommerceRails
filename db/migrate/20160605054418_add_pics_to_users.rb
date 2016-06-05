class AddPicsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_one, :string
    add_column :users, :image_two, :string
    add_column :users, :image_three, :string
    add_column :users, :image_four, :string
  end
end
