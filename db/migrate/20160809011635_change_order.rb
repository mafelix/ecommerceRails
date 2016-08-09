class ChangeOrder < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.rename :users_id, :user_id
    end
    change_table :carts do |t|
      t.rename :users_id, :user_id
    end
  end
end
