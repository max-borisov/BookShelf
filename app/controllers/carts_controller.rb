class CartsController < ApplicationController

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to books_path, flash: { success: 'A new book has been added to your shopping cart.' }
    end
  end

  def cart_params
    params.require(:cart).permit(:user_id, :book_id)
  end
end
