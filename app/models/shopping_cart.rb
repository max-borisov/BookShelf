class ShoppingCart

  def initialize user
    @user = user
  end

  # @todo Wrap transaction
  def checkout
    cart_items        = get_cart_items
    cart_total_price  = get_total_cart_sum(cart_items)
    order             = create_order(cart_total_price)
    order_items       = prepare_order_items(order, cart_items)
    add_items_to_order(order_items)
    destroy_cart_items(@user, cart_items)
  end

  private
    def get_cart_items
      CartItem.joins(:book).where(user_id: @user.id).pluck(:id, :book_id, :price)
    end

    def get_total_cart_sum(cart_items)
      order_sum = 0;
      cart_items.each { |x| order_sum += x[2] }
      order_sum
    end

    def create_order(total_price)
      Order.create!(user_id: @user.id, total_price: total_price)
    end

    def prepare_order_items(order, cart_items)
      order_items = []
      cart_items.each do |item|
        order_items << { order_id: order.id, book_id: item[1] }
      end
      order_items
    end

    def add_items_to_order(order_items)
      OrderItem.create!(order_items)
    end

    def destroy_cart_items(user_id, cart_items)
      ids = []
      cart_items.each { |i| ids << i[0] }
      CartItem.destroy(ids.uniq)
    end
end
