require 'rails_helper'

describe "orders history page", :type => :feature do
  before(:each) do
    @user = create(:user)
    log_in_as(@user)
    visit orders_path
  end

  it 'has title' do
    expect(find('h1')).to have_content('Orders history')
  end

  it 'has message that there are orders yet' do
    expect(page).to have_content('You don\'t have any orders yet.')
  end
end