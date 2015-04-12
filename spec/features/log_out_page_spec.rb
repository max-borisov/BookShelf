require 'rails_helper'

describe "logout page", :type => :feature do
  before(:each) do
    @user = create(:user)
    log_in_as(@user)
    page.driver.submit :delete, logout_path, {}
  end

  it 'gets redirected to the front page' do
    expect(current_path).to eq(root_path)
  end

  it 'has "Sign in" link' do
    expect(page).to have_content('Sign in')
  end
end