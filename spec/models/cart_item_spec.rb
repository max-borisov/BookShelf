require 'rails_helper'

RSpec.describe CartItem, :type => :model do
  describe 'validation' do
    subject(:cart_item) { build(:cart_item) }

    context 'when model is valid' do
      it 'has a valid factory' do
        expect(cart_item).to be_valid
      end
    end

    context 'when model is not valid' do
      it 'is invalid without a user' do
        validate_presence_of(cart_item, :user_id)
      end

      it 'is invalid without a book' do
        validate_presence_of(cart_item, :book_id)
      end

      it 'is invalid if user_id is not a number' do
        cart_item[:user_id] = nil
        cart_item.valid?
        expect(cart_item.errors['user_id']).to include("is not a number")
      end

      it 'is invalid if book_id is not a number' do
        cart_item[:book_id] = nil
        cart_item.valid?
        expect(cart_item.errors['book_id']).to include("is not a number")
      end
    end
  end

  describe 'relations with User and Book models' do
    describe 'User relation' do
      subject(:cart_item) { create(:cart_item) }

      it 'returns user name' do
        expect(cart_item.user[:name]).not_to be_empty
      end

      it 'returns user email' do
        expect(cart_item.user[:email]).not_to be_empty
      end
    end
  end

  context 'when cart item has many books' do
    before do
      @user = create(:user)
      create_list(:cart_item, 3, user: @user)
    end

    it 'returns a list of items' do
      expect(CartItem.where(user_id: @user[:id])).not_to be_empty
    end
  end
end
