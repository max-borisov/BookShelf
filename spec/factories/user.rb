FactoryGirl.define do
  factory :user do
    name              Faker::Name.name
    email             Faker::Internet.email
    password_digest   nil
    remember_digest   nil
    activation_digest nil
    activated_at      Faker::Time.between(3.days.ago, Time.now)
    activated         true
    reset_digest      nil
    reset_sent_at     nil
    admin             false
    before(:create) { |user| user.password = '123456' }

    factory :not_activated_user do
      activated false
    end

    factory :user_with_expired_password_reset_digest do
      reset_sent_at 10.hours.ago
    end

    factory :admin do
      admin true
    end
  end
end
