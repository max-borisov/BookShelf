require 'rails_helper'

RSpec.describe Order, :type => :model do
  subject(:order) { build(:order) }

  describe 'validation' do
    context 'when model is valid' do
      it 'is has a valid attributes' do
        expect(order).to be_valid
      end
    end

    context 'when model is not valid' do
      it 'is invalid without a user_id' do
        validate_presence_of(order, :user_id)
      end

      it 'is invalid without a total_price' do
        validate_presence_of(order, :total_price)
      end

      it 'is invalid if user_id is a string' do
        order[:user_id] = 'aaa'
        order.valid?
        expect(order.errors[:user_id]).to include("is not a number")
      end

      it 'is invalid if user_id is a numeric(not integer)' do
        order[:user_id] = 12.12
        order.valid?
        expect(order.errors[:user_id]).to include("must be an integer")
      end

      it 'is invalid if total_price is not numeric ' do
        order[:total_price] = 'aaa'
        order.valid?
        expect(order.errors[:total_price]).to include("is not a number")
      end
    end
  end
end
