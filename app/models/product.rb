class Product < ActiveRecord::Base
  has_many :reviews
  belongs_to :order

  scope :searchName, -> (search) {where("lower(name) LIKE ?", "%#{search}%")} 
end