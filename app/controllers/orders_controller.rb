class OrdersController < ApplicationController
  def index

  end

  def create
    @order = Order.new
    @order.save current_user

    redirect_to :root
  end
end
