FactoryGirl.define do
  factory :user do
    name              Faker::Name.name
    email             Faker::Internet.email
    password_digest   ''
    remember_digest   ''
    activation_digest ''
    activated_at      Faker::Time.between(3.days.ago, Time.now)
    activated         true
    reset_digest      ''
    reset_sent_at     ''
    admin             false
    before(:create) { |user| user.password = '123456' }

    factory :not_activated_user do
      activated false
    end

    factory :admin do
      admin true
    end
  end
end
