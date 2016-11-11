FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com" }
    password { Faker::Internet.password(8) }
    password_confirmation { password }

    factory :admin do
      admin true
    end
  end

  factory :category do
    sequence(:name) { |n| "#{Faker::Name.name}#{n}" }
    sequence(:sort_order) { |n| n }
  end

  factory :book do
    categories { [create(:category)] }

    title { Faker::Book.title }
    description { Faker::Book.title }
    author_name { Faker::Book.author }
    publisher_name { Faker::Book.publisher }
    published_date { Faker::Date.between(2.years.ago, Date.today) }
    unit_price { Faker::Commerce.price }
  end
end
