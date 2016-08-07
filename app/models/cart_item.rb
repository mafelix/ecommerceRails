class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
  # validate :product_present
  validate :cart_present
  # need a new validation that doesn't mess up the product_id scope validations
  # was interfering with setting cart_item.cart_id = nil
# validates :cart_id, uniqueness:{ :scope => :product_id, :message => "Product already added." }

  before_save :finalize
  # a = CartItem.new; a.test_model test method for activerecord

  # def test_model
  #   return "It works"
  # end
  def empty_cart
    self.each do |item|
      item.cart_id = nil
      item.save!
    end
  end

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

  def sub_total
    cart_items.collect {|item| item.valid? item.quantity * item.unit_price}.sum
  end

  private

  def product_present
    if product.nil?
      errors.add(:product, "Is not valid or is not active")
    end
  end

  def cart_present
    if cart.nil?
      errors.add(:cart, "is not a valid cart")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = total_price
  end

end
