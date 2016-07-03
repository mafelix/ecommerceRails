class Product < ActiveRecord::Base
  mount_uploader :picture, ProductImageUploader
  has_many :reviews
  has_many :cart_items

  before_destroy :ensure_not_referenced_by_any_cart_item
  # has_and_belongs_to_many :cart_items

  #
  default_scope {where(active: true)}
  scope :searchName, -> (search) {where("lower(name) LIKE ?", "%#{search}%")}
  # scope :green, -> {where("category = ?", "1")}
  # scope :accessories, -> {where("category = ?", "2")}
  # scope :herbal, -> {where("cateogry = ?", "3")}


  private

    def ensure_not_referenced_by_any_cart_item
      if cart_items.empty?
        return true
      else
        errors.add(:base, "Cart Items present")
        return false
      end
    end
end
