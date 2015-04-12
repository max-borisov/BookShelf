require 'rails_helper'

describe "update password page", :type => :feature do
  before(:each) do
    @user = create(:user)
    log_in_as(@user)
    visit '/password-update'
  end

  it 'has title' do
    expect(find('h1')).to have_content('Update password')
  end

  it 'has form' do
    expect(page).to have_selector('.edit_user')
  end
end