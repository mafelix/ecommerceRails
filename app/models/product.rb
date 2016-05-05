class Product < ActiveRecord::Base
  has_many :reviews
  belongs_to :order
  # belongs_to :user, through: :orders
end