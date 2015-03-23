class ReviewsController < ApplicationController
  before_action :set_book, only: [:create, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def create
    @review = @book.reviews.build(review_params)
    @review.user_id = current_user.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to book_path(@book), flash: {success: 'New review has been added.' } }
        format.js   {}
      else
        format.html { redirect_to book_path(@book), flash: {danger: 'Review could not be saved.' } }
        format.js   {}
      end
    end
  end

  def destroy
    if current_user.admin?
      @book.reviews.destroy(params[:id])
    else
      @book.reviews.where(user_id: current_user).destroy(params[:id])
    end
    respond_to do |format|
      format.html { redirect_to book_path(@book), flash: { success: 'Review has been deleted.' } }
      format.js   {}
    # else
      # format.html { redirect_to book_path(@book), flash: {danger: 'Review could not be saved.' } }
      # format.js   {}
    end
  end

  private
    def review_params
      params.require(:review).permit(:text)
    end

    def set_book
      @book = Book.find(params[:book_id])
    end
end
