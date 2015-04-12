require 'rails_helper'

describe "sign in page", :type => :feature do
  before(:all) do
    @user = create(:user)
  end

  context 'when guest user opens a page' do
    it 'sees login form' do
      visit signin_path
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end
  end

  context 'when logged in user opens a page' do
    it 'gets redirected to the front page' do
      log_in_as(@user)
      visit signin_path
      expect(current_path).to eq(root_path)
    end
  end

  context 'when login/password are incorrect' do
    it 'sees error message' do
      visit signin_path
      within("form") do
        fill_in 'Email', :with => 'test@gm.com'
        fill_in 'Password', :with => '000000'
        click_button 'Sign in'
      end
      expect(page).to have_content('Invalid email/password combination')
    end
  end

  context 'when login/password are correct' do
    before(:each) do
      log_in_as(@user)
    end

    it 'gets redirected to the front page' do
      visit signin_path
      expect(current_path).to eq(root_path)
    end

    it 'sees "Action" link in the menu' do
      visit root_path
      expect(find('.dropdown')).to have_content('Actions')
    end

    it 'sees user name on the navigation bar' do
      visit root_path
      expect(page).to have_selector('.nav-user-name')
    end
  end
end