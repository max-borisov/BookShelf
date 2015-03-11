FactoryGirl.define do
  factory :book do
    title         Faker::Name.title
    author        Faker::Name.name
    publisher     "O'Reilly"
    pub_date      Faker::Date.backward(10)
    price         39.95
    sequence(:isbn) { |n| Faker::Number.number(7) + n.to_s }
    sequence(:amazon_id) { |n| Faker::Number.number(6) + n.to_s }
    description   Faker::Lorem.paragraph(2)
  end
end
