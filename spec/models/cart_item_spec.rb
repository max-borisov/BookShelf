require 'rails_helper'

RSpec.describe CartItem, :type => :model do
  describe 'model validation' do
    let(:cart_item) { build(:cart_item) }

    context 'when model is valid' do
      it 'has a valid factory' do
        expect(cart_item).to be_valid
      end
    end

    context 'when model is not valid' do
      it 'is invalid without a user' do

      end

      it 'is invalid without a book' do

      end

      it 'is invalid if user_id is not a number' do

      end

      it 'is invalid if book_id is not a number' do

      end
    end
  end

  context 'when cart item has many books' do

  end
end
