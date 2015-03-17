class CartItemsController < ApplicationController
  def index
    set_books_catalog_url
    @cart_items = CartItem.joins(:book).where(user_id: current_user).order(created_at: :asc)
  end

  def create
    # @todo Try this code User.cartItem.build
    @cart_item = CartItem.new(book_id: params[:book_id], user_id: current_user.id)
    if @cart_item.save
      book_title = Book.find(params[:book_id]).title
      # redirect_to back_to_books_catalog_link, flash: { success: "\"#{book_title}\" book has been added to your shopping cart." }
      redirect_to root_url, flash: { success: "\"#{book_title}\" book has been added to your shopping cart." }
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy if @cart_item.user.id == current_user.id
    redirect_to cart_items_path, flash: { success: "\"#{@cart_item.book.title}\" has been removed for the shopping cart." }
  end
end
