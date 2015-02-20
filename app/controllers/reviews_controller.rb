class ReviewsController < ApplicationController
  # before_action :set_review_with_book, only: [:destroy]
  before_action :set_book, only: [:destroy]

  def destroy
    @book.reviews.destroy(params[:id])
    redirect_to book_path(@book), flash: { success: 'Review has been deleted.' }
  end

  private
    # @todo Show error msg if record not found
    def set_review_with_book
      @review = Book.find(params[:book_id]).reviews.where(id: params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

end
