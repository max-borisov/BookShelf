require 'rails_helper'

describe "book page", :type => :feature do
  context 'with incorrect book url' do
    before(:each) do
      visit '/books/1010101010'
    end

    it 'gets redirected to the front page' do
      expect(current_path).to eq(root_path)
    end

    it 'shows error message' do
      expect(page).to have_content('Record not found')
    end
  end

  context 'with correct book url' do
    let(:book) { create(:book) }
    let(:tom) { create(:user, email: 'tom@gmail.com') }
    let(:bob) { create(:user, email: 'bob@gmail.com') }

    context 'when user is guest' do
      describe 'book information block' do
        before(:each) do
          visit book_url(book)
        end

        it 'has page title' do
          expect(page).to have_selector('h1')
        end

        it 'has book preview' do
          expect(page).to have_selector('.book-cover-lg')
        end

        it 'has price' do
          expect(page).to have_selector('.book-price-block')
        end

        it 'does not have form to add review' do
          expect(page).not_to have_selector('.add-review-block')
        end
      end

      describe 'reviews block' do
        context 'when book has reviews' do
          it 'shows reviews' do
            create_list(:review, 1, user: bob, book: book)
            visit book_url(book)
            expect(page).to have_selector('.review-block')
          end
        end
      end
    end

    context 'when user is not guest' do
      context 'when it is a regular logged in user' do
        it 'has interface to delete user related reviews' do
          log_in_as(bob)
          create_list(:review, 2, user: bob, book: book)
          visit book_path(book)
          expect(all('button[title="Delete review"]').count).to eq(2)
        end

        it 'has interface to add review' do
          log_in_as(bob)
          visit book_path(book)
          expect(page).to have_selector('#new_review')
        end

        it 'increases reviews count after new one was added' do
          log_in_as(bob)
          visit book_path(book)
          review_text = 'New review.'
          fill_in 'Add your review/opinion', :with => review_text
          click_button 'Send'
          expect(all('button[title="Delete review"]').count).to eq(1)
        end

        it 'decreases reviews count after one was deleted', :js => true do
          create_list(:review, 2, user: tom, book: book)
          log_in_as(tom)
          visit book_path(book)
          accept_alert do
            first("button[title='Delete review']").click
          end
          expect(all('button[title="Delete review"]').count).to eq(1)
        end
      end

      context 'when user has admin privileges' do
        it 'has interface to delete all reviews' do
          create_list(:review, 2, user: tom, book: book)
          create_list(:review, 2, user: bob, book: book)
          admin = create(:admin, email: 'admin@gmail.com')
          log_in_as(admin)
          visit book_path(book)
          expect(all('button[title="Delete review"]').count).to eq(4)
        end
      end
    end
  end
end