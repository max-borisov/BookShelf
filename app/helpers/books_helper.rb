module BooksHelper
  def book_cover(title, amazon_id)
    if amazon_id.nil?
      url = "http://placehold.it/140x172"
    else
      url = "http://images.amazon.com/images/P/#{amazon_id}.01.ZTZZZZZZ.jpg"
    end
    image_tag url, alt: title
  end

  def search_book_checked_value(search_type)
    params[:search] == search_type ? true : false
  end
end
