require 'rails_helper'

describe "shopping cart page", :type => :feature do
  context 'when user is guest' do
    it 'gets redirected to sign in page' do
      visit cart_items_path
      expect(current_path).to eq(signin_path)
    end
  end

  context 'when user is logged in' do
    before(:all) do
      @tom = create(:user, email: 'tom@gmail.com')
      @bob = create(:user, email: 'bob@gmail.com')
      book = create(:book, price: 10)
      create_list(:cart_item, 3, user_id: @tom.id, book_id: book.id)
    end

    it 'has title' do
      log_in_as(@tom)
      visit cart_items_path
      expect(page).to have_selector('h1')
    end

    context 'when cart is empty' do
      it 'shows information message' do
        log_in_as(@bob)
        visit cart_items_path
        expect(page).to have_content('You have 0 items in your shopping cart')
      end
    end

    context 'when it has books' do
      before(:each) do
        log_in_as(@tom)
        visit cart_items_path
      end

      it 'has list of saved books' do
        # save_and_open_page
        expect(all('.book-cover-mini').count).to eq(3)
      end

      xit 'shows total price'
      xit 'has "Checkout" button'
      xit 'has "Delete from cart" button'
    end
  end
end