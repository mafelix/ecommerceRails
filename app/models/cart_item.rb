class CartItem < ActiveRecord::Base
  belongs_to :cart
  # has_and_belongs_to_many :products
  belongs_to :product
  

  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
  # validate :product_present
  validate :order_present
  validates :order_id, uniqueness:{ :scope => :product_id, :message => "Product already added." }

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private

  def product_present
    if product.nil?
      errors.add(:product, "Is not valid or is not active")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = total_price
  end

end
