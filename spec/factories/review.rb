FactoryGirl.define do
  factory :review do
    text    'New review'
    book
    user
  end
end
