class Order<ActiveRecord::Base
  belongs_to :user
  has_many :cart_items

  # before saving the order update the subtotal of the order.
  before_save :update_subtotal

  private

  def update_subtotal
      self[:subtotal] = subtotal
  end
end
