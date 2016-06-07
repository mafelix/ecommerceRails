class Order<ActiveRecord::Base
# still need to modify database schema to reflect associations
  belongs_to :user
  has_many :carts
  before_save :update_subtotal

  # before saving the order update the subtotal of the order.

  def subtotal
    cart_items.collect {|cart_items| cart_items.valid? ? (cart_items.quantity * cart_items.unit_price) : 0}.sum
  end

  private

  def update_subtotal
      self[:subtotal] = subtotal
  end

end
