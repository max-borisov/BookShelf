module CartItemsHelper
  def cart_items_amount user
    CartItem.where(user_id: user.id).count
  end

  def total_price_for_cart user
    CartItem.joins(:book).where(user_id: user.id).sum('price')
  end
end
