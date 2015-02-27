module BooksHelper
  def amazon_book_cover(amazon_id, title)
    image_tag "http://images.amazon.com/images/P/#{amazon_id}.01.ZTZZZZZZ.jpg", alt: title
  end

  def search_book_checked_value(search_type)
    params[:search] == search_type ? true : false
  end
end
