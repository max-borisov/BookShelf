class BooksController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, except: [:index, :show]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # GET /books
  # GET /books.json
  def index
    set_books_catalog_url
    @books = Book.search(params[:keywords]).order(created_at: :asc).page(params[:page])
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @reviews = @book.reviews
    @review = Review.new
    @back_button_url = back_to_books_catalog_url
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    if @book.update(book_params)
      redirect_to @book, flash: { success: 'Book was successfully updated.' }
    else
      render :edit
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    title = @book.title
    @book.destroy
    redirect_to books_url, flash: { success: "Book \"#{title}\" has been deleted." }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :publisher, :pub_date, :description, :price, :isbn, :amazon_id)
    end
end
