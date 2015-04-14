require 'rails_helper'

describe "shopping cart page", :type => :feature do
  context 'when user is guest' do
    it 'gets redirected to sign in page' do
      visit cart_items_path
      expect(current_path).to eq(signin_path)
    end
  end

  context 'when user is logged in' do
    # @todo use let() instead. all vs each vs let. what is better ?
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
        expect(all('.book-cover-mini').count).to eq(3)
      end

      it 'shows total price' do
        expect(find('.cart-items-info-message')).to have_content('Total price: $' + 30.to_s)
      end

      it 'has "Checkout" button' do
        expect(find('.cart-items-info-message')).to have_selector('input[value="Checkout"]')
      end

      it 'has "Delete from cart" button' do
        expect(all('input[value="Delete from cart"]').count).to eq(3)
      end

      context 'when delete book from cart' do
        before(:each) do
          accept_alert do
            first('form input[value="Delete from cart"]').click
          end
        end

        it 'shows notification message and desreases books amout', js: true do
          expect(page).to have_content('has been removed for the shopping cart')
          expect(all('form input[value="Delete from cart"]').count).to eq(2)
        end
      end

      context 'when checkout' do
        before(:each) do
          click_button('Checkout')
        end

        it 'gets redirected to the orders page' do
          expect(page).to have_content('Orders history')
        end

        it 'shows how many books were ordered' do
          expect(page).to have_content('have been purchased')
        end

        it 'shows ordered books' do
          expect(page).to have_selector('.order-history-row')
        end
      end
    end
  end
end