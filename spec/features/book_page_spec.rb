require 'rails_helper'

describe "book page", :type => :feature do
  before(:all) do
    @book = create(:book)
    @tom = create(:user, email: 'tom@gmail.com')
    @bob = create(:user, email: 'bob@gmail.com')
    create_list(:review, 2, user: @tom, book: @book)
    create_list(:review, 1, user: @bob, book: @book)
  end

  context 'when user is guest' do
    before(:each) do
      visit book_url(@book)
    end

    it 'has page title' do
      expect(page).to have_selector('h1')
    end

    it 'has book preview' do
      expect(page).to have_selector('.book-cover-lg')
    end

    it 'has price' do
      expect(page).to have_selector('.book-price-block')
    end

    it 'does not have form to add review' do
      expect(page).not_to have_selector('.add-review-block')
    end

    context 'when book has reviews' do
      it 'shows reviews' do
        expect(page).to have_selector('.review-block')
      end
    end
  end

  context 'when user is not guest' do
    context 'when it is a regular user' do
      # @todo log in
      it 'is possible delete only user related reviews' do
        session[:user_id] = $tom[:id]
        visit book_url(@book)

        expect(all('Delete review').count).to eq(2)
            # .to have_selector('.review-block')
      end

      xit 'add review'
    end

    context 'when it is an admin' do
      xit 'can delete any review'
    end
  end
end