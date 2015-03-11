require 'rails_helper'

RSpec.describe Review, :type => :model do
  before { @review = build(:review) }

  context 'model validation' do
    it 'is has a valid factory' do
      expect(@review).to be_valid
    end

    it 'is invalid without a review text' do
      validate_presence_of(@review, :text)
    end
  end

  it 'sanitizes review text before save' do
    @review[:text] = '<p>hello</p><a></a>test"'
    @review.save
    expect(@review[:text]).to eq('hellotest"')
  end
end
