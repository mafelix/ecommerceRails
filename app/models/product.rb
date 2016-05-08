class Product < ActiveRecord::Base
  has_many :reviews
  belongs_to :order

  scope :searchName, -> (search) {where("lower(name) LIKE ?", "%#{search}%")} 
  # scope :green, -> {where("category = ?", "1")}
  # scope :accessories, -> {where("category = ?", "2")}
  # scope :herbal, -> {where("cateogry = ?", "3")}
end