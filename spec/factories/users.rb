FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com" }
    password { Faker::Internet.password(8) }
    password_confirmation { password }
    confirmed_at Time.current
    full_name { Faker::Name.name }

    factory :admin do
      admin true
    end
  end
end
