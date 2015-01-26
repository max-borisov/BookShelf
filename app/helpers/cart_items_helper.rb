module CartItemsHelper
  def cart_items_amount user
    CartItem.where(user_id: user.id).count
  end

  def empty_cart user
    CartItem.select('id').where(user_id: user.id).limit(1).empty?
  end

  def total_price_for_cart user
    CartItem.joins(:book).where(user_id: user.id).sum('price')
  end
end
