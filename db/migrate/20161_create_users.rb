class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :view_history
      t.string :purchase_history


      t.timestamps
    end
  end
end
