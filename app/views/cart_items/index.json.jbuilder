json.array!(@cart_items) do |cart_item|
  json.extract! cart_item, :id, :cart_id, :product_id, :order_id, :unit_price, :quantity, :total_price
  json.url cart_item_url(cart_item, format: :json)
end
