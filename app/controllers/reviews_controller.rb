class ReviewsController < ApplicationController
  before_action :set_book, only: [:create, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def create
    @review = @book.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_message = { success: 'New review has been added.' }
    else
      redirect_message = { danger: 'Review could not be saved.' }
    end
    redirect_to book_path(@book), flash: redirect_message
  end

  def destroy
    @book.reviews.where(user_id: current_user).destroy(params[:id])
    redirect_to book_path(@book), flash: { success: 'Review has been deleted.' }
  end

  private
    def review_params
      params.require(:review).permit(:text)
    end

    def set_book
      @book = Book.find(params[:book_id])
    end
end
