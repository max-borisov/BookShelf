FactoryGirl.define do
  factory :book do
    review
    title         'New title'
    author        'New author'
    publisher     'Pragmatic bookshelf'
    pub_date      '2015-01-12'
    price         '39.95'
    isbn          '1234567890'
    description   'Book description'

    factory :book_ruby do
      title         'Ruby guide'
      author        'Author'
      publisher     "O'Reilly"
      pub_date      '2015-01-12'
      price         '39.95'
      isbn          '1234567891'
      amazon_id     '123'
      description   'Ruby book description'
    end

    factory :book_php do
      title         'PHP guide'
      author        'Author'
      publisher     "O'Reilly"
      pub_date      '2015-01-12'
      price         '39.95'
      isbn          '1234567892'
      amazon_id     '456'
      description   'PHP book description'
    end
  end
end