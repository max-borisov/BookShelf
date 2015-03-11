FactoryGirl.define do
  factory :review do
    text Faker::Lorem.paragraph(2)
    user
    book
  end
end
