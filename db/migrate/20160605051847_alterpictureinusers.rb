class Alterpictureinusers < ActiveRecord::Migration
  def change
    remove_column :users, :pictureid
  end
end
