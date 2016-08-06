class OrdersController < ApplicationController
  def index
    set_books_catalog_url
    @orders = current_user.orders.includes(:order_items)
  end

  def create
    # @todo Add transaction
    # begin
    
    return

    transaction do
      order = Order.create!(
          user_id: current_user.id,
          total_price: CartItem.get_total_price(current_user)
      )

      raise 'ERROR'

      shopping_cart_books = CartItem.get_books_ids(current_user)
      order.attach_books(shopping_cart_books)
      CartItem.destroy_books(current_user)

    rescue => e
      # redirect_to cart_items_path, flash: { danger: e.message }
      redirect_to cart_items_path, flash: { danger: 'Checkout operation failed. Please, try again later.' }
      # return
    end
    redirect_to orders_path
  end
end
