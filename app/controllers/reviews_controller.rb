class ReviewsController < ApplicationController
  before_action :set_book, only: [:destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def destroy
    @book.reviews.destroy(params[:id])
    redirect_to book_path(@book), flash: { success: 'Review has been deleted.' }
  end

  private
    def set_book
      @book = Book.find(params[:book_id])
    end

    def record_not_found
      redirect_to books_path, flash: { danger: 'Record not found' }
    end
end
