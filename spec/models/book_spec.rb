require 'rails_helper'

describe Book, :type => :model do
  describe 'validation' do
    subject(:book) { build(:book) }

    context 'when model is valid' do
      it 'has a valid factory' do
        expect(book).to be_valid
      end
    end

    context 'when model is not valid' do
      it 'is invalid without title' do
        validate_presence_of(book, :title)
      end

      it 'is invalid without author' do
        validate_presence_of(book, :author)
      end

      it 'is invalid without publisher' do
        validate_presence_of(book, :publisher)
      end

      it 'is invalid without pub_date' do
        validate_presence_of(book, :pub_date)
      end

      it 'is invalid without price' do
        validate_presence_of(book, :price)
      end

      it 'is invalid without isbn' do
        validate_presence_of(book, :isbn)
      end

      it 'is invalid without description' do
        validate_presence_of(book, :description)
      end

      it 'is invalid with a title longer then 150 characters' do
        validate_max_length_of(book, :title, 151)
      end

      it 'is invalid with an author name longer less 150 characters' do
        validate_max_length_of(book, :author, 151)
      end

      xit 'is invalid with an ISBN name longer then 10 characters'

      it 'is invalid with an amazon id longer then 50 characters' do
        validate_max_length_of(book, :amazon_id, 51)
      end

      it 'is invalid with not unique ISBN' do
        validate_uniqueness_of(book, :isbn, build(:book))
      end

      it 'is invalid with not unique amazon id' do
        validate_uniqueness_of(book, :amazon_id, build(:book))
      end

      it 'is invalid with not numeric price' do
        book[:price] = 'aaa'
        book.valid?
        expect(book.errors[:price]).to include('is not a number')
      end
    end
  end

  describe '#set_keywords' do
    context 'when before_save is triggered' do
      it 'creates a string with searchable keywords' do
        book = create(:book)
        expect(book.keywords).to eq([book[:title], book[:author], book[:isbn], book[:amazon_id]].join(' '))
      end
    end
  end

  describe '#search' do
    describe 'search books by keywords' do
      before(:all) do
        @book_php   = create(:book, title: 'PHP guide')
        @book_ruby  = create(:book, title: 'Ruby guide')
        @book_js    = create(:book, title: 'JS guide')
      end

      context 'with matching title' do
        it 'returns an array of books that match' do
          search_result = Book.search('guide')
          expect(search_result).to eq([@book_php, @book_ruby, @book_js])
        end
      end

      context 'with no matching keyword' do
        it 'returns an empty array, omits books that do not match' do
          search_result = Book.search('no match')
          expect(search_result).to eq([])
        end
      end
    end
  end

  describe 'reviews relation' do
    context 'with reviews' do
      before do
        @book = FactoryGirl.create(:book)
        @user = FactoryGirl.create(:user)
        create_list(:review, 3, user: @user, book: @book)
      end

      it 'returns amount of book reviews' do
        expect(@book.reviews.count).to eq(3)
      end
    end

    context 'with no reviews' do
      it 'returns an empty array' do
        book = create(:book)
        expect(book.reviews).to eq([])
      end
    end
  end
end
