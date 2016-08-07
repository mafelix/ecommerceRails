class Order<ActiveRecord::Base
# still need to modify database schema to reflect associations
  belongs_to :user
  belongs_to :order_status
  has_many :cart_items

  before_save :set_order_status
  # before_save :order_not_empty

  # has_many :carts
  # before_save :update_subtotal

  # before saving the order update the subtotal of the order.

  # def subtotal
  #   cart_items.collect {|cart_items| cart_items.valid? ? (cart_items.quantity * cart_items.unit_price) : 0}.sum
  # end
  #
  private

  def set_order_status
    self.order_status_id = 1
  end

  def order_not_empty
    self.cart_items.count > 0
  end
  #
  # def update_subtotal
  #     self[:subtotal] = subtotal
  # end

end
