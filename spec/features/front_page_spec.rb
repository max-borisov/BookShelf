require 'rails_helper'

describe "front page", :type => :feature do
  describe 'page content' do
    before(:all) do
      create(:book, title: 'ruby')
      create(:book, title: 'ruby on rails')
      create(:book, title: 'php')
      create_list(:book, 13)
    end

    before(:each) do
      visit root_path
    end

    it "has page title and content" do
      expect(page).to have_content('Pragmatic bookshelf')
      expect(page).to have_selector('div.book-info-block')
    end

    context 'when click on book\'s title' do
      it 'opens book\'s page' do
        all('.book-info-block')[0].all('a')[0].click
        expect(page).to have_selector('h1')
      end
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
      context 'when matches are found' do
        it 'shows 2 books which contain "ruby" keyword' do
          within('.search-book-form') do
            fill_in 'keywords', :with => 'ruby'
            click_on('Search')
          end
          expect(all('div.book-info-block').length).to eq(2)
        end
      end

      context 'when matches were not found' do
        it 'shows info message when after attempt to search book with "oops" keyword' do
          within('.search-book-form') do
            fill_in 'keywords', :with => 'oops'
            click_on('Search')
          end
          expect(page).to have_content('No books found')
        end
      end

      describe 'reset form' do
        context 'when click on Reset button' do
          it 'reloads the page and resets search form' do
            within('.search-book-form') do
              click_on('Reset')
            end
            expect(find_field('keywords').value).to eq(nil)
          end
        end
      end
    end
  end

  describe 'nav bar links' do
    context 'when user is logged in' do
      before(:all) do
        @user = create(:user)
        log_in_as(@user)
        visit root_path
        @menu = find('.dropdown-menu')
      end

      context 'when click on "Actions" link' do
        it 'has "Profile" link' do
          expect(@menu).to have_content('Profile')
        end

        it 'has "Orders" link' do
          expect(@menu).to have_content('Orders')
        end

        it 'has "Update password" link' do
          expect(@menu).to have_content('Profile')
        end

        it 'has "Log out" link' do
          expect(@menu).to have_content('Log out')
        end
      end
    end
  end
end