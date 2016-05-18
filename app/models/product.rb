class Product < ActiveRecord::Base
  has_many :reviews
  has_many :cart_items
  belongs_to :order
  
  # has_and_belongs_to_many :cart_items

  scope :searchName, -> (search) {where("lower(name) LIKE ?", "%#{search}%")}
  # scope :green, -> {where("category = ?", "1")}
  # scope :accessories, -> {where("category = ?", "2")}
  # scope :herbal, -> {where("cateogry = ?", "3")}
end
