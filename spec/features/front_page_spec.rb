require 'rails_helper'

describe "front page", :type => :feature do
  before(:each) do
    create(:book, title: 'ruby')
    create(:book, title: 'ruby on rails')
    create(:book, title: 'php')
  end

  # let!(:book) { create(:book, title: 'ruby') }

  it "has page title and content" do
=begin
    create(:book, title: 'ruby')
    create(:book, title: 'ruby on rails')
    create(:book, title: 'php')
=end



    visit '/'

    expect(page).to have_content('Pragmatic bookshelf')
    expect(page).to have_selector('div.book-info-block')

    # save_and_open_screenshot
  end

  context 'when click on sign in link' do
    it 'shows sign in page' do
      click_link('Sign in')
      expect(page).to have_content 'Email'
      expect(page).to have_content 'Password'
    end
  end

  context 'when click on Next button on pagination widget' do
    it 'shows list of books' do
      within('.pull-left') do
        find('.next_page a').click
      end
      expect(page).to have_selector('div.book-info-block')
    end
  end

  describe 'search books form' do
    context 'when search for "rails" text' do
      xit 'shows list of books which contain "rails" keyword' do
        within('.search-book-form') do
          fill_in 'keywords', :with => 'rails'
          click_on('Search')
        end
        expect(page).to have_selector('div.book-info-block')
      end
    end

    context 'when search for "oops" text' do
      xit 'shows a message that books were not found' do
        within('.search-book-form') do
          fill_in 'keywords', :with => 'oops'
          click_on('Search')
        end
        expect(page).to have_content('No books found')
      end
    end

    describe 'Reset form button' do
      xit 'reloads the page and resets search form' do
        click_link('Reset')
        expect(find_field('keywords').value).to eq('')
      end
    end
  end
end