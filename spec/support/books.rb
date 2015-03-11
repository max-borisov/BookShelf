def validate_uniqueness_of(model, attribute)
  @book.save
  dup_book = build(:book)
  dup_book[attribute] = @book[attribute]
  dup_book.valid?
  expect(dup_book.errors[attribute]).to include('is not unique')
end