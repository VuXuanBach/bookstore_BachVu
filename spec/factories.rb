FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com"}
    password { Faker::Internet.password(8) }
    password_confirmation { password }

    factory :admin do
      admin true
    end
  end
end