class Order<ActiveRecord::Base
  belongs_to :user
  has_many :cart_items

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
