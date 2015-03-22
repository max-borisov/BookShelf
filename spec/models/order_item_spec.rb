require 'rails_helper'

RSpec.describe OrderItem, :type => :model do
  subject(:order_item) { build(:order_item) }

  describe 'validation' do
    context 'when model is valid' do
      it 'is has a valid attributes' do
        expect(order_item).to be_valid
      end
    end

    context 'when model is not valid' do
      it 'is invalid without an order_id' do
        validate_presence_of(order_item, :order_id)
      end

      it 'is invalid without a book_id' do
        validate_presence_of(order_item, :book_id)
      end

      it 'is invalid if order_id is not an integer' do
        order_item[:order_id] = 12.12
        order_item.valid?
        expect(order_item.errors[:order_id]).to include("must be an integer")
      end

      it 'is invalid if book_id is not an integer' do
        order_item[:book_id] = 12.12
        order_item.valid?
        expect(order_item.errors[:book_id]).to include("must be an integer")
      end
    end
  end
end
