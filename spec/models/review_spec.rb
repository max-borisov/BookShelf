require 'rails_helper'

RSpec.describe Review, :type => :model do
  let(:review) { build(:review) }

  describe 'model validation' do
    context 'when model is valid' do
      it 'is has a valid factory' do
        expect(review).to be_valid
      end
    end

    context 'when model is not valid' do
      it 'is invalid without a review text' do
        validate_presence_of(review, :text)
      end
    end
  end

  describe '#sanitize_html' do
    context 'when before_save is triggered' do
      it 'sanitizes review text' do
        review[:text] = '<p>hello</p><a></a>test"'
        review.save
        expect(review[:text]).to eq('hellotest"')
      end
    end
  end
end
