require 'rails_helper'

# @todo clean database before each example

describe "orders history page", :type => :feature do
  before(:all) do
    @tom = create(:user, email: 'tom@gmail.com')
    @bob = create(:user, email: 'bob@gmail.com')
    order = create(:order, user_id: @tom.id, total_price: 20)
    book_php = create(:book, price: 20)
    create(:order_item, order_id: order.id, book_id: book_php.id)
  end

  context 'when user is guest' do
    it 'gets redirected to the sign in page' do
      visit orders_path
      expect(find('h1')).to have_content('Sign in')
    end
  end

  context 'when user is logged in' do
    it 'shows page title' do
      log_in_as(@bob)
      visit orders_path
      expect(find('h1')).to have_content('Orders history')
    end
  end

  context 'when user has orders' do
    before(:each) do
      log_in_as(@tom)
      visit orders_path
    end

    it 'shows ordered books' do
      expect(all('.order-history-row').count).to eq(1)
    end

    it 'shows total price' do
      expect(find('.orders-history-alert')).to have_content('You spent $20.00')
    end
  end

  context 'when user does not have orders' do
    it 'shows notification message' do
      log_in_as(@bob)
      visit orders_path
      expect(page).to have_content('You don\'t have any orders yet.')
    end
  end
end