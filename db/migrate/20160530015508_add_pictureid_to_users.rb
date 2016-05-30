class AddPictureidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pictureid, :string
  end
end
