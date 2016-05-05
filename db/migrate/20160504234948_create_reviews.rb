class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.text :content
      t.integer :rating_out_of_five

      t.timestamps
    end
  end
end
