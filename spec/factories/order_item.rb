FactoryGirl.define do
  factory :order_item do
    order
    book
  end
end
