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
    description { Faker::Lorem.paragraph }
    author_name { Faker::Book.author }
    publisher_name { Faker::Book.publisher }
    published_date { Faker::Date.between(2.years.ago, Date.today) }
    unit_price { Faker::Commerce.price }

    factory :book_photo do
      book_photo_list = [
        'book_cover_1.jpg',
        'book_cover_2.jpg',
        'book_cover_3.jpg',
        'book_cover_4.jpg'
      ]
      photo { File.new("#{Rails.root}/app/assets/images/#{book_photo_list.sample}") }
    end
  end
end
