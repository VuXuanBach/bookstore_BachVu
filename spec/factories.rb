FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com"}
    fake_password = Faker::Internet.password(8)
    password fake_password
    password_confirmation fake_password

    factory :admin do
      admin true
    end
  end
end
