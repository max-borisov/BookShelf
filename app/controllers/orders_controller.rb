class OrdersController < ApplicationController
  def index
    set_books_catalog_url
    @orders = Order.where(user_id: current_user.id).order(created_at: :desc)
  end

  def create
    begin
      @order = Order.new
      @order.save current_user
    rescue => e
      # redirect_to cart_items_path, flash: { danger: e.message }
      redirect_to cart_items_path, flash: { danger: 'Checkout operation failed. Please, try again later.' }
      return
    end
    redirect_to orders_path
  end
end
