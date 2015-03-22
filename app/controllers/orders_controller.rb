class OrdersController < ApplicationController
  def index
    set_books_catalog_url
    @orders = User.get_orders(current_user)
  end

  def create
    # todo Check there are items in the Shopping cart
    begin
      order = Order.create!(
          user_id: current_user.id,
          total_price: CartItem.get_total_price(current_user)
      )
      shopping_cart_books = CartItem.get_books_ids(current_user)
      shopping_cart_books.each { |book_id| order.order_items.create(book_id: book_id) }
      CartItem.destroy_items(current_user, shopping_cart_books)
    rescue => e
      # redirect_to cart_items_path, flash: { danger: e.message }
      redirect_to cart_items_path, flash: { danger: 'Checkout operation failed. Please, try again later.' }
      return
    end
    redirect_to orders_path
  end
end
