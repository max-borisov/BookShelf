require 'rails_helper'

describe "profile page", :type => :feature do
  before(:each) do
    @user = create(:user)
    log_in_as(@user)
    visit user_path(@user)
  end

  it 'has title' do
    expect(find('h1')).to have_content('Profile')
  end

  it 'has user preview' do
    expect(page).to have_selector('img')
  end
end